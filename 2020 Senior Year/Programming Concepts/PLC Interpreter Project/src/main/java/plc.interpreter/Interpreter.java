package plc.interpreter;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Collectors;

public final class Interpreter {

    /**
     * The VOID constant represents a value that has no useful information. It
     * is used as the return value for functions which only perform side
     * effects, such as print, similar to Java.
     */
    public static final Object VOID = new Function<List<Ast>, Object>() {

        @Override
        public Object apply(List<Ast> args) {
            return VOID;
        }

    };

    public final PrintWriter out;
    public Scope scope;

    public Interpreter(PrintWriter out, Scope scope) {
        this.out = out;
        this.scope = scope;
        init();
    }

    /**
     * Delegates evaluation to the method for the specific instance of AST. This
     * is another approach to implementing the visitor pattern.
     */
    public Object eval(Ast ast) {
        if (ast instanceof Ast.Term) {
            return eval((Ast.Term) ast);
        } else if (ast instanceof Ast.Identifier) {
            return eval((Ast.Identifier) ast);
        } else if (ast instanceof Ast.NumberLiteral) {
            return eval((Ast.NumberLiteral) ast);
        } else if (ast instanceof Ast.StringLiteral) {
            return eval((Ast.StringLiteral) ast);
        } else {
            throw new AssertionError(ast.getClass());
        }
    }

    /**
     * Evaluations the Term ast, which returns the value resulting by calling
     * the function stored under the term's name in the current scope. You will
     * need to check that the type of the value is a {@link Function}, and cast
     * to the type {@code Function<List<Ast>, Object>}.
     */
    private Object eval(Ast.Term ast) {
        return requireType(Function.class, scope.lookup(ast.getName())).apply(ast.getArgs());
    }

    /**
     * Evaluates the Identifier ast, which returns the value stored under the
     * identifier's name in the current scope.
     */
    private Object eval(Ast.Identifier ast) {
        return scope.lookup(ast.getName());
    }

    /**
     * Evaluates the NumberLiteral ast, which returns the stored number value.
     */
    private BigDecimal eval(Ast.NumberLiteral ast) {
        return ast.getValue();
    }

    /**
     * Evaluates the StringLiteral ast, which returns the stored string value.
     */
    private String eval(Ast.StringLiteral ast) {
        return ast.getValue();
    }

    /**
     * Initializes the interpreter with fields and functions in the standard
     * library.
     */
    private void init() {
        scope.define("print", (Function<List<Ast>, Object>) args ->
        {
            List<Object> evaluated = args.stream().map(this::eval).collect(Collectors.toList());
            evaluated.forEach(out::print);
            out.println();
            return VOID;
        });

        scope.define("+", (Function<List<Ast>, Object>) args ->
        {
            List<BigDecimal> evaluated = args.stream().map(a -> requireType(BigDecimal.class, eval(a))).collect(Collectors.toList());
            BigDecimal result = BigDecimal.ZERO;
            for(int i = 0 ; i < evaluated.size(); i++)
                result = result.add(evaluated.get(i));
            return result;
        });

        scope.define("-", (Function<List<Ast>, Object>) args ->
        {
            List<BigDecimal> evaluated = args.stream().map(a -> requireType(BigDecimal.class, eval(a))).collect(Collectors.toList());
            if(evaluated.isEmpty())
                throw new EvalException("Arguments to - cannot be empty.");
            else if(evaluated.size() == 1)
                return evaluated.get(0).negate();
            else
            {
                BigDecimal result = evaluated.get(0);
                for(int i = 1; i < evaluated.size(); i++)
                {
                    result = result.subtract(evaluated.get(i));
                }
                return result;
            }
        });

        scope.define("*", (Function<List<Ast>, Object>) args ->
        {
            List<BigDecimal> evaluated = args.stream().map(a -> requireType(BigDecimal.class, eval(a))).collect(Collectors.toList());
            BigDecimal result = BigDecimal.ONE;
            for(int i = 0 ; i < evaluated.size(); i++)
                result = result.multiply(evaluated.get(i));
            return result;
        });

        scope.define("/", (Function<List<Ast>, Object>) args ->
        {
            List<BigDecimal> evaluated = args.stream().map(a -> requireType(BigDecimal.class, eval(a))).collect(Collectors.toList());
            if(evaluated.isEmpty())
                throw new EvalException("Arguments to / cannot be empty.");
            else if(evaluated.size() == 1)
            {
                if(evaluated.get(0) == BigDecimal.ZERO)
                    throw new EvalException("Inverse Error: Cannot divide by 0.");
                return BigDecimal.ONE.divide(evaluated.get(0), RoundingMode.HALF_EVEN);
            }
            else
            {
                if(evaluated.get(0) == BigDecimal.ZERO)
                    throw new EvalException("Dividing Error: Cannot divide by 0.");
                BigDecimal result = evaluated.get(0);
                for(int i = 1; i < evaluated.size(); i++)
                {
                    if(evaluated.get(i) == BigDecimal.ZERO)
                        throw new EvalException("Dividing Error: Cannot divide by 0.");
                    result = result.divide(evaluated.get(i), RoundingMode.HALF_EVEN);
                }
                return result;
            }
        });

        scope.define("true", true);
        scope.define("false", false);

        scope.define("equals?", (Function<List<Ast>, Object>) args ->
        {
            if(args.size() != 2)
                throw new EvalException("ERROR: \"equals?\" given more or less than 2 arguments");

            List<Object> evaluated = args.stream().map(a -> requireType(Object.class, eval(a))).collect(Collectors.toList());

            return Objects.deepEquals(evaluated.get(0), evaluated.get(1));
        });

        scope.define("not", (Function<List<Ast>, Object>) args ->
        {
            if(args.size() != 1)
                throw new EvalException("ERROR: \"not\" given more or less than 1 arguments");

            return !requireType(Boolean.class, eval(args.get(0)));
        });

        scope.define("and", (Function<List<Ast>, Object>) args ->
        {
            for(int i = 0; i < args.size(); i++)
            {
                if(requireType(Boolean.class, eval(args.get(i))) == false)
                    return false;
            }
            return true;
        });

        scope.define("or", (Function<List<Ast>, Object>) args ->
        {
            for(int i = 0; i < args.size(); i++)
            {
                if(requireType(Boolean.class, eval(args.get(i))) == true)
                    return true;
            }
            return false;
        });

        scope.define("<", (Function<List<Ast>, Object>) args ->
        {
            List<BigDecimal> evaluated = args.stream().map(a -> requireType(BigDecimal.class, eval(a))).collect(Collectors.toList());
            if(evaluated.size() <= 1)
                return true;
            for(int i = 0; i < evaluated.size() - 1; i++)
            {
                if(evaluated.get(i).compareTo(evaluated.get(i+1)) != -1)
                    return false;
            }

            return true;
        });

        scope.define("<=", (Function<List<Ast>, Object>) args ->
        {
            List<BigDecimal> evaluated = args.stream().map(a -> requireType(BigDecimal.class, eval(a))).collect(Collectors.toList());
            if(evaluated.size() <= 1)
                return true;
            for(int i = 0; i < evaluated.size() - 1; i++)
            {
                if(evaluated.get(i).compareTo(evaluated.get(i+1)) == 1)
                    return false;
            }

            return true;
        });

        scope.define(">", (Function<List<Ast>, Object>) args ->
        {
            List<BigDecimal> evaluated = args.stream().map(a -> requireType(BigDecimal.class, eval(a))).collect(Collectors.toList());
            if(evaluated.size() <= 1)
                return true;
            for(int i = 0; i < evaluated.size() - 1; i++)
            {
                if(evaluated.get(i).compareTo(evaluated.get(i+1)) != 1)
                    return false;
            }

            return true;
        });

        scope.define(">=", (Function<List<Ast>, Object>) args ->
        {
            List<BigDecimal> evaluated = args.stream().map(a -> requireType(BigDecimal.class, eval(a))).collect(Collectors.toList());
            if(evaluated.size() <= 1)
                return true;
            for(int i = 0; i < evaluated.size() - 1; i++)
            {
                if(evaluated.get(i).compareTo(evaluated.get(i+1)) == -1)
                    return false;
            }

            return true;
        });

        scope.define("list", (Function<List<Ast>, Object>) args ->
        {
            List<Object> evaluated = args.stream().map(a -> requireType(Object.class, eval(a))).collect(Collectors.toList());

            List result = new LinkedList();
            for(int i = 0; i < evaluated.size(); i++)
            {
                result.add(evaluated.get(i));
            }
            return result;
        });

        scope.define("range", (Function<List<Ast>, Object>) args ->
        {
            List<BigDecimal> evaluated = args.stream().map(a -> requireType(BigDecimal.class, eval(a))).collect(Collectors.toList());
            if(evaluated.size() != 2)
                throw new EvalException("ERROR: \"range\" given more or less than 2 arguments");
            if(evaluated.get(0).compareTo(evaluated.get(1)) == 1)//if first is bigger, it returns 1
                throw new EvalException("ERROR for \"range\" : first # is bigger than second #");

            int start = evaluated.get(0).intValue();
            int end = evaluated.get(1).intValue();
            BigDecimal BDstart = new BigDecimal(start);
            BigDecimal BDend = new BigDecimal(end);
            //convert to int, use that int to convert to big decimal. If the compareTo is 0,
            //then the original was an int. Else, not an int, throw exception.

            if(BDstart.compareTo(evaluated.get(0)) != 0 || BDend.compareTo(evaluated.get(1)) != 0)
                throw new EvalException("ERROR for \"range\" : One or both values are not integers");

            List result = new LinkedList();
            for(int i = start; i < end; i++)
            {
                result.add(BigDecimal.valueOf(i));
            }
            return result;
        });

        scope.define("define", (Function<List<Ast>, Object>) args ->
        {
            //List<Object> evaluated = args.stream().map(this::eval).collect(Collectors.toList());

            if(args.size() < 2)
                throw new EvalException("ERROR \"define\": less than 2 arguments");
            else if(args.size() == 2)
                scope.define(requireType(Ast.Identifier.class, args.get(0)).getName(), eval(args.get(1)));
            //else
            //{
            //    String name = requireType(Ast.Term.class, args.get(0)).getName();
            //    List parameters = requireType(Ast.Term.class, args.get(0)).getArgs();
            //    Ast logic = requireType(Ast.class, args.get(1));
//
            //    scope.define(name, logic);
//
//
            //    scope = new Scope(scope);
//
            //    for(int i = 0; i < parameters.size(); i++)
            //    {
            //        scope.define(parameters.get(i).toString(), null);
            //    }
//
            //    eval(logic);
//
            //    scope = scope.getParent();
//
//
            //}
            //I can't seem to figure out how to define a function

            return VOID;

        });

        scope.define("set!", (Function<List<Ast>, Object>) args ->
        {
            if(args.size() != 2)
                throw new EvalException("ERROR \"set!\": more or less than 2 arguments");

            scope.set(requireType(Ast.Identifier.class, args.get(0)).getName(), eval(args.get(1)));

            return VOID;
        });

        scope.define("do", (Function<List<Ast>, Object>) args ->
        {
            scope = new Scope(scope);

            List<Object> evaluated = args.stream().map(this::eval).collect(Collectors.toList());

            scope = scope.getParent();

            return !evaluated.isEmpty() ? evaluated.get(evaluated.size() - 1) : VOID;
        });

        scope.define("while", (Function<List<Ast>, Object>) args ->
        {
            if(args.size() != 2)
                throw new EvalException("ERROR \"while\": more or less than 2 arguments");

            scope = new Scope(scope);

            while(requireType(Boolean.class, eval(args.get(0)))) //if tests don't work, take out eval()
                eval(args.get(1));

            scope = scope.getParent();

            return VOID;
        });

        scope.define("for", (Function<List<Ast>, Object>) args ->
        {
            if(args.size() != 2)
                throw new EvalException("ERROR \"for\": more or less than 2 arguments");

            scope = new Scope(scope);

            String identifier = requireType(Ast.Term.class, args.get(0)).getName();
            List arguments = requireType(Ast.Term.class, args.get(0)).getArgs();

            //Error is here. I don't know how to take the List and check if it is a list of numbers
            //or a list of variables containing the numbers I need. The given test for 'for' creates
            //the list 'number' then uses it. So my list 'arguments' above is just a list with one value
            //and that is the String "numbers". I cannot figure out how to evaluate or lookup numbers in
            //in order to get the values of numbers.

            scope.define(identifier, 0);

            for(int i = 0; i <= arguments.size(); i++)
            {
                scope.set(identifier, requireType(BigDecimal.class, arguments.get(i)));
                eval(args.get(1));
            }

            scope = scope.getParent();

            return VOID;
        });

    }

    /**
     * A helper function for type checking, taking in a type and an object and
     * throws an exception if the object does not have the required type.
     *
     * This function does a poor job of actually identifying where the issue
     * occurs - in a real interpreter, we would have a stacktrace to provide
     * that implementation. For now, this is the simple-but-not-ideal solution.
     */
    private static <T> T requireType(Class<T> type, Object value) {
        if (type.isInstance(value)) {
            return type.cast(value);
        } else {
            throw new EvalException("Expected " + value + " to have type " + type.getSimpleName() + ".");
        }
    }

}
