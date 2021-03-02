package plc.compiler;

import com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.lang.Double;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.regex.Pattern;

/**
 * See the specification for information about what the different visit
 * methods should do.
 */
public final class Analyzer implements Ast.Visitor<Ast>
{

    public Scope scope;

    public Analyzer(Scope scope) {
        this.scope = scope;
    }

    @Override
    public Ast visit(Ast.Source ast) throws AnalysisException
    {
        if(ast.getStatements().isEmpty())
        {
            throw new AnalysisException("ERROR: Ast is empty");
        }

        return new Ast.Source(ast.getStatements());
    }

    /**
     * Statically validates that visiting a statement returns a statement.
     */
    private Ast.Statement visit(Ast.Statement ast) throws AnalysisException
    {
        return (Ast.Statement) visit((Ast) ast);
    }

    @Override
    public Ast.Statement.Expression visit(Ast.Statement.Expression ast) throws AnalysisException
    {
        if(!(ast.getExpression() instanceof Ast.Expression.Function))
        {
            throw new AnalysisException("ERROR: Expression is not Expression.Function.");
        }

        return new Ast.Statement.Expression(visit(ast.getExpression()));
    }

    @Override
    public Ast.Statement.Declaration visit(Ast.Statement.Declaration ast) throws AnalysisException
    {
        String type = ast.getType();

        if(type.equals("VOID"))
        {
            throw new AnalysisException("ERROR: Cannot declare a VOID type");
        }
        if(ast.getValue().isPresent())
        {
            Ast.Expression myExpression = visit(ast.getValue().get());

            if(type.equals("STRING"))
            {
                if(!Pattern.matches("[A-Za-z0-9_!?.+-/* ]*", type))
                    throw new AnalysisException("ERROR: Cannot assign value to type String.");

                return new Ast.Statement.Declaration(ast.getName(), "String", Optional.of(myExpression));

                //return here, but what?
            }
            else if(type.equals("BOOLEAN"))
            {
                if(!myExpression.equals(true) && !myExpression.equals(false))
                    throw new AnalysisException("ERROR: Declaring a boolean must have a true/false value");

                return new Ast.Statement.Declaration(ast.getName(), "boolean", Optional.of(myExpression));
            }
            else if(type.equals("INTEGER"))
            {
                if(!Pattern.matches("[0-9]+", type))
                    throw new AnalysisException("ERROR: Cannot assign value to type Integer.");

                return new Ast.Statement.Declaration(ast.getName(), "int", Optional.of(myExpression));
            }
            else if(type.equals("DECIMAL"))
            {
                if(!Pattern.matches("[0-9]+(\\.[0-9])*", type))
                    throw new AnalysisException("ERROR: Cannot assign value to type Decimal.");

                return new Ast.Statement.Declaration(ast.getName(), "double", Optional.of(myExpression));
            }
            else
            {
                throw new AnalysisException("ERROR: Invalid type for Declaration");
            }
        }
            return new Ast.Statement.Declaration(ast.getName(), ast.getType(), Optional.empty());

    }

    @Override
    public Ast.Statement.Assignment visit(Ast.Statement.Assignment ast) throws AnalysisException
    {
        //do excepions
        //Stdlib.Type myType = scope.lookup(ast.getName());
        return new Ast.Statement.Assignment(ast.getName(), visit(ast.getExpression()));
    }

    @Override
    public Ast.Statement.If visit(Ast.Statement.If ast) throws AnalysisException
    {
        Ast.Expression condition = ast.getCondition();
        List<Ast.Statement> thenStatements = ast.getThenStatements();
        List<Ast.Statement> elseStatements = ast.getElseStatements();

        condition = visit(condition);
        String test = condition.getType().getName();

        if(!condition.getType().getName().equals("BOOLEAN"))
        {
            throw new AnalysisException("ERROR: IF condition is not boolean");
        }
        if(ast.getThenStatements().isEmpty())
        {
            throw new AnalysisException("ERROR: THEN statement is empty in IF");
        }

        scope = new Scope(scope);
        for(int i = 0; i < thenStatements.size(); i++)
        {
            thenStatements.set(i, visit(thenStatements.get(i)));
        }
        scope = scope.getParent();

        scope = new Scope(scope);
        for(int i = 0; i < elseStatements.size(); i++)
        {
            elseStatements.set(i, visit(elseStatements.get(i)));
        }
        scope = scope.getParent();

        return new Ast.Statement.If(condition, thenStatements, elseStatements);
    }

    @Override
    public Ast.Statement.While visit(Ast.Statement.While ast) throws AnalysisException
    {
        Ast.Expression condition = ast.getCondition();
        List<Ast.Statement> statements = ast.getStatements();

        condition = visit(condition);
        String test = condition.getType().getName();

        if(!condition.getType().getName().equals("BOOLEAN"))
        {
            throw new AnalysisException("ERROR: IF condition is not boolean");
        }

        scope = new Scope(scope);
        for(int i = 0; i < statements.size(); i++)
        {
            statements.set(i, visit(statements.get(i)));
        }
        scope = scope.getParent();

        return new Ast.Statement.While(condition, statements);
    }

    /**
     * Statically validates that visiting an expression returns an expression.
     */
    private Ast.Expression visit(Ast.Expression ast) throws AnalysisException
    {
        return (Ast.Expression) visit((Ast) ast);
    }

    @Override
    public Ast.Expression.Literal visit(Ast.Expression.Literal ast) throws AnalysisException
    {
        if (ast.getValue() instanceof Boolean) {
            return new Ast.Expression.Literal(Stdlib.Type.BOOLEAN, ast.getValue());
        }
        else if (ast.getValue() instanceof BigInteger)
        {
            int newValue;

            try
            {
                newValue = ((BigInteger) ast.getValue()).intValueExact();
            }
            catch(ArithmeticException e)
            {
                throw new AnalysisException("I'm right here");
            }

            return new Ast.Expression.Literal(Stdlib.Type.INTEGER, newValue); // dunno if this is right
        }
        else if (ast.getValue() instanceof BigDecimal)
        {
            Double newValue = ((BigDecimal) ast.getValue()).doubleValue();

            if(newValue.isInfinite())
            {
                throw new AnalysisException("ERROR: Double is out of range. Became infinite.");
            }

            return new Ast.Expression.Literal(Stdlib.Type.DECIMAL, newValue);
        }
        else if (ast.getValue() instanceof String)
        {
            String newValue = ast.getValue().toString();
            if(!Pattern.matches("[A-Za-z0-9_!?.+-/* ]*", newValue))
            {
                throw new AnalysisException("ERROR: String has invalid characters.");
            }
            return new Ast.Expression.Literal(Stdlib.Type.STRING, newValue);
        }
        else
        {
            throw new AnalysisException("ERROR: Given Ast was not a Boolean, Integer, Decimal, or String");
        }
    }

    @Override
    public Ast.Expression.Group visit(Ast.Expression.Group ast) throws AnalysisException
    {
        return new Ast.Expression.Group(visit(ast.getExpression()));
    }

    @Override
    public Ast.Expression.Binary visit(Ast.Expression.Binary ast) throws AnalysisException
    {
        String myOperator = ast.getOperator();

        Ast.Expression myLeftExpression = visit(ast.getLeft());
        Ast.Expression myRightExpression = visit(ast.getRight());


        if(myOperator.equals("==") || myOperator.equals("!="))
        {
            if(myLeftExpression.getType() == Stdlib.Type.VOID || myRightExpression.getType() == Stdlib.Type.VOID)
                throw new AnalysisException("ERROR: '==' and '!=' cannot be given type VOID");

            return new Ast.Expression.Binary(Stdlib.Type.BOOLEAN, myOperator, myLeftExpression, myRightExpression);

        }
        else if (myOperator.equals("+"))
        {
            if(myLeftExpression.getType() == Stdlib.Type.VOID || myRightExpression.getType() == Stdlib.Type.VOID)
                throw new AnalysisException("ERROR: '==' and '!=' cannot be given type VOID");
            if(myLeftExpression.getType() == Stdlib.Type.STRING || myRightExpression.getType() == Stdlib.Type.STRING)
                return new Ast.Expression.Binary(Stdlib.Type.STRING, myOperator, myLeftExpression, myRightExpression);
            else if(myLeftExpression.getType() == Stdlib.Type.INTEGER && myRightExpression.getType() == Stdlib.Type.INTEGER)
                return new Ast.Expression.Binary(Stdlib.Type.INTEGER, myOperator, myLeftExpression, myRightExpression);
            else if(myLeftExpression.getType() == Stdlib.Type.DECIMAL && myRightExpression.getType() == Stdlib.Type.DECIMAL)
                return new Ast.Expression.Binary(Stdlib.Type.DECIMAL, myOperator, myLeftExpression, myRightExpression);
            else
                throw new AnalysisException("ERROR: ' -,*,/' binary given incorrect types.");
        }
        else if(myOperator.equals("-") || myOperator.equals("*") || myOperator.equals("/"))
        {
            if(myLeftExpression.getType() == Stdlib.Type.INTEGER && myRightExpression.getType() == Stdlib.Type.INTEGER)
                return new Ast.Expression.Binary(Stdlib.Type.INTEGER, myOperator, myLeftExpression, myRightExpression);
            else if(myLeftExpression.getType() == Stdlib.Type.DECIMAL && myRightExpression.getType() == Stdlib.Type.DECIMAL)
                return new Ast.Expression.Binary(Stdlib.Type.DECIMAL, myOperator, myLeftExpression, myRightExpression);
            else
                throw new AnalysisException("ERROR: ' -,*,/' binary given incorrect types.");
        }
        else
        {
            throw new AnalysisException("ERROR: Not a binary. Shouldn't even get here, but just in case");
        }
    }

    @Override
    public Ast.Expression.Variable visit(Ast.Expression.Variable ast) throws AnalysisException
    {
        //throw exception if not defined
        return new Ast.Expression.Variable(ast.getType(), ast.getName());
    }

    @Override
    public Ast.Expression.Function visit(Ast.Expression.Function ast) throws AnalysisException
    {
        String name = ast.getName();
        int arity = ast.getArguments().size();
        Stdlib.Function myFunction = Stdlib.getFunction(name, arity);

        return ast;
    }

    /**
     * Throws an AnalysisException if the first type is NOT assignable to the target type. * A type is assignable if and only if one of the following is true:
     *  - The types are equal, as according to Object#equals
     *  - The first type is an INTEGER and the target type is DECIMAL
     *  - The first type is not VOID and the target type is ANY
     */
    public static void checkAssignable(Stdlib.Type type, Stdlib.Type target) throws AnalysisException
    {
        if(type.equals(target))
            return;
        else if(type.getName().equals("INTEGER") && target.getName().equals("DECIMAL"))
            return;
        else if(!type.getName().equals("VOID") && target.getName().equals("ANY"))
            return;
        else
            throw new AnalysisException("ERROR: Type not assignable to Target");
    }

}
