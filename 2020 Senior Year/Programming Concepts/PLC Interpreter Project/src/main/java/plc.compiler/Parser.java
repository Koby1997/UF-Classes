package plc.compiler;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * The parser takes the sequence of tokens emitted by the lexer and turns that
 * into a structured representation of the program, called the Abstract Syntax
 * Tree (AST).
 *
 * The parser has a similar architecture to the lexer, just with {@link Token}s
 * instead of characters. As before, {@link #peek(Object...)} and {@link
 * #match(Object...)} are helpers to make the implementation easier.
 *
 * This type of parser is called <em>recursive descent</em>. Each rule in our
 * grammar will have it's own function, and reference to other rules correspond
 * to calling that functions.
 */
public final class Parser {

    private final TokenStream tokens;

    public Parser(List<Token> tokens)
    {
        this.tokens = new TokenStream(tokens);
    }

    /**
     * Parses the tokens and returns the parsed AST.
     */
    public static Ast parse(List<Token> tokens) throws ParseException
    {
        return new Parser(tokens).parseSource();
    }

    /**
     * Parses the {@code source} rule.
     */
    public Ast.Source parseSource() throws ParseException
    {
        List<Ast.Statement> statements = new ArrayList<>();

        while(tokens.has(1))
            statements.add(parseStatement());

        return new Ast.Source(statements);
    }

    /**
     * Parses the {@code statement} rule and delegates to the necessary method.
     * If the next tokens do not start a declaration, assignment, if, or while
     * statement, then it is an expression statement. See these methods for
     * clarification on what starts each type of statement.
     */
    public Ast.Statement parseStatement() throws ParseException
    {
        if(match("LET"))
            return parseDeclarationStatement();
        else if(match("IF"))
            return parseIfStatement();
        else if(match("WHILE"))
            return parseWhileStatement();
        else if(match(Token.Type.IDENTIFIER, "="))
            return parseAssignmentStatement();
        else
            return parseExpressionStatement();
    }

    /**
     * Parses the {@code declaration-statement} rule. This method should only be
     * called if the next tokens start a declaration statement, aka {@code let}.
     */
    public Ast.Statement.Declaration parseDeclarationStatement() throws ParseException
    {
        if(!match(Token.Type.IDENTIFIER, ":", Token.Type.IDENTIFIER))
            throw new ParseException("ERROR: Start of Declaration-statement not IDENTIFIER : IDENTIFIER", tokens.index);

        String name = tokens.get(-3).getLiteral();
        String type = tokens.get(-1).getLiteral();
        Optional<Ast.Expression> value = Optional.empty();

        if(match("="))
            value = Optional.of(parseExpression());//not exactly sure if this is correct

        if(!match(";"))
            throw new ParseException("ERROR: no ';' at the end of declaration-statement", tokens.index);

        return new Ast.Statement.Declaration(name, type, value);

    }

    /**
     * Parses the {@code assignment-statement} rule. This method should only be
     * called if the next tokens start an assignment statement, aka both an
     * {@code identifier} followed by {@code =}.
     */
    public Ast.Statement.Assignment parseAssignmentStatement() throws ParseException
    {
        String name = tokens.get(-2).getLiteral(); //we already matched the name and the '='
        Ast.Expression expression = parseExpression();

        if(!match(";"))
            throw new ParseException("No ';' at end of assignment-statment", tokens.index);

        return new Ast.Statement.Assignment(name, expression);
    }

    /**
     * Parses the {@code expression-statement} rule. This method is called if
     * the next tokens do not start another statement type, as explained in the
     * javadocs of {@link #parseStatement()}.
     */
    public Ast.Statement.Expression parseExpressionStatement() throws ParseException
    {
        Ast.Expression expression = parseExpression();

        if(!match(";"))
            throw new ParseException("No ';' at end of expression-statement", tokens.index);

        return new Ast.Statement.Expression(expression);
    }

    /**
     * Parses the {@code if-statement} rule. This method should only be called
     * if the next tokens start an if statement, aka {@code if}.
     */
    public Ast.Statement.If parseIfStatement() throws ParseException
    {
        List<Ast.Statement> thenStatements = new ArrayList<>(); //check Ast.Statement
        List<Ast.Statement> elseStatements = new ArrayList<>();

        if(peek("THEN"))
            throw new ParseException("No expression at start of IF-statement", tokens.index);

        Ast.Expression condition = parseExpression();

        if(!match("THEN"))
            throw new ParseException("No 'THEN' after expression in IF-statement", tokens.index);

        while(!peek("ELSE") && !peek("END"))
            thenStatements.add(parseStatement());

        if(match("ELSE"))
        {
            while(!peek("END"))
                elseStatements.add(parseStatement());
        }

        if(!match("END"))
            throw new ParseException("No ending to IF-statement", tokens.index);

        return new Ast.Statement.If(condition, thenStatements, elseStatements);
    }

    /**
     * Parses the {@code while-statement} rule. This method should only be
     * called if the next tokens start a while statement, aka {@code while}.
     */
    public Ast.Statement.While parseWhileStatement() throws ParseException
    {
        List<Ast.Statement> statements = new ArrayList<>();

        if(peek("DO"))
            throw new ParseException("No expression at start of WHILE-statement", tokens.index);

        Ast.Expression condition = parseExpression();

        if(!match("DO"))
            throw new ParseException("No DO in WHILE-statement", tokens.index);

        while(!match("END"))
            statements.add(parseStatement());

        return new Ast.Statement.While(condition, statements);
    }

    /**
     * Parses the {@code expression} rule.
     */
    public Ast.Expression parseExpression() throws ParseException
    {
        return parseEqualityExpression();
    }

    /**
     * Parses the {@code equality-expression} rule.
     */
    public Ast.Expression parseEqualityExpression() throws ParseException
    {
        Ast.Expression left = parseAdditiveExpression();

        if(peek("!=") || peek("=="))
        {
            Ast.Expression right = new Ast.Expression.Literal("nah"); // this is wrong, updated for compiler
            String operator = new String();

            while(match("!=") || match("==")) {
                operator = tokens.get(-1).getLiteral();
                right = parseAdditiveExpression();
            }
            return new Ast.Expression.Binary(operator, left, right);
        }
        else
            return left;
    }

    /**
     * Parses the {@code additive-expression} rule.
     */
    public Ast.Expression parseAdditiveExpression() throws ParseException
    {
        Ast.Expression left = parseMultiplicativeExpression();

        if(peek("-") || peek("+"))
        {
            Ast.Expression right = new Ast.Expression.Literal("nah"); // this is wrong, updated for Compiler
            String operator = new String();

            while(match("-") || match("+")) {
                operator = tokens.get(-1).getLiteral();
                right = parseMultiplicativeExpression();
            }
            return new Ast.Expression.Binary(operator, left, right);
        }
        else
            return left;
    }

    /**
     * Parses the {@code multiplicative-expression} rule.
     */
    public Ast.Expression parseMultiplicativeExpression() throws ParseException
    {
        Ast.Expression left = parsePrimaryExpression();

        if(peek("/") || peek("*"))
        {
            Ast.Expression right = new Ast.Expression.Literal("nah"); // this is wrong, updated for Compiler
            String operator = new String();

            while(match("/") || match("*")) {
                operator = tokens.get(-1).getLiteral();
                right = parsePrimaryExpression();
            }
            return new Ast.Expression.Binary(operator, left, right);
        }
        else
            return left;
    }

    /**
     * Parses the {@code primary-expression} rule. This is the top-level rule
     * for expressions and includes literal values, grouping, variables, and
     * functions. It may be helpful to break these up into other methods but is
     * not strictly necessary.
     */
    public Ast.Expression parsePrimaryExpression() throws ParseException
    {

        if(match("(")) //group
        {
            Ast.Expression expression = parseExpression();
            if(!match(")"))
                throw new ParseException("No ending ')' in primary-expression, Group", tokens.index);

            return new Ast.Expression.Group(expression);
        }
        else if(match(Token.Type.INTEGER))
        {
            BigInteger number = new BigInteger(tokens.get(-1).getLiteral());
            return new Ast.Expression.Literal(number);
        }
        else if(match(Token.Type.DECIMAL))
        {
            BigDecimal number = new BigDecimal(tokens.get(-1).getLiteral());
            return new Ast.Expression.Literal(number);
        }
        else if(match(Token.Type.STRING))
        {
            String noQuotes = tokens.get(-1).getLiteral();
            if(noQuotes.length() == 2)
                return new Ast.Expression.Literal("");//edge case where it is an empty string

            noQuotes = noQuotes.substring(1, noQuotes.length() - 1);
            noQuotes = noQuotes.replace("\\n", "\n");
            noQuotes = noQuotes.replace("\\r", "\r");
            noQuotes = noQuotes.replace("\\t", "\t");
            return new Ast.Expression.Literal(noQuotes);
        }
        else if(match(Token.Type.IDENTIFIER)) // This can be boolean, variable, or function
        {
            String name = tokens.get(-1).getLiteral();

            //I don't know if we are supposed to do the boolean this way
            //it kind of feels like garbage code but I can't think of another way
            if(name.equals("TRUE"))
                return new Ast.Expression.Literal(true);
            else if(name.equals("FALSE"))
                return new Ast.Expression.Literal(false);

            if(match( "("))
            {
                List<Ast.Expression> arguments = new ArrayList<>();

                while(!match(")"))
                {
                    arguments.add(parseExpression());
                    if(peek(",", ")"))
                        throw new ParseException("ERROR: no expression after ',' in function", tokens.index);

                    match(","); //don't care if this is true or false;
                }
                return new Ast.Expression.Function(name, arguments);
            }

            return new Ast.Expression.Variable(name);
        }
        else
        {
            throw new ParseException("ERROR: It should never reach here", tokens.index);
        }
    }


    /**
     * As in the lexer, returns {@code true} if the current sequence of tokens
     * matches the given patterns. Unlike the lexer, the pattern is not a regex;
     * instead it is either a {@link Token.Type}, which matches if the token's
     * type is the same, or a {@link String}, which matches if the token's
     * literal is the same.
     *
     * In other words, {@code Token(IDENTIFIER, "literal")} is matched by both
     * {@code peek(Token.Type.IDENTIFIER)} and {@code peek("literal")}.
     */
    private boolean peek(Object... patterns)
    {
        for (int i = 0; i < patterns.length; i++)
        {
            if (!tokens.has(i))
            {
                return false;
            }
            else if (patterns[i] instanceof Token.Type)
            {
                if (patterns[i] != tokens.get(i).getType())
                {
                    return false;
                }
            }
            else if (patterns[i] instanceof String)
            {
                String test = tokens.get(i).getLiteral();
                if (!patterns[i].equals(tokens.get(i).getLiteral()))
                {
                    return false;
                }
            }
            else
            {
                throw new AssertionError();
            }
        }
        return true;
    }

    /**
     * As in the lexer, returns {@code true} if {@link #peek(Object...)} is true
     * and advances the token stream.
     */
    private boolean match(Object... patterns)
    {
        boolean peek = peek(patterns);
        if (peek)
        {
            for (int i = 0; i < patterns.length; i++)
            {
                tokens.advance();
            }
        }
        return peek;
    }

    private static final class TokenStream
    {

        private final List<Token> tokens;
        private int index = 0;

        private TokenStream(List<Token> tokens)
        {
            this.tokens = tokens;
        }

        /**
         * Returns true if there is a token at index + offset.
         */
        public boolean has(int offset)
        {
            return index + offset < tokens.size();
        }

        /**
         * Gets the token at index + offset.
         */
        public Token get(int offset)
        {
            return tokens.get(index + offset);
        }

        /**
         * Advances to the next token, incrementing the index.
         */
        public void advance()
        {
            index++;
        }
    }
}
