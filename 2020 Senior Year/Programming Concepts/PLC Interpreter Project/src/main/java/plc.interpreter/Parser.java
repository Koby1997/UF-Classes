package plc.interpreter;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
public final class Parser
{

    private final TokenStream tokens;

    private Parser(String input)
    {
        tokens = new TokenStream(Lexer.lex(input));
    }

    /**
     * Parses the input and returns the AST
     */
    public static Ast parse(String input)
    {
        return new Parser(input).parse();
    }

    /**
     * Repeatedly parses a list of ASTs, returning the list as arguments of an
     * {@link Ast.Term} with the identifier {@code "source"}.
     */
    private Ast parse()
    {
        String name = "source";
        List<Ast> args = new ArrayList<>();

        while(tokens.has(1))
            args.add(parseAst());

        return new Ast.Term(name,args);
    }

    /**
     * Parses an AST from the given tokens based on the provided grammar. Like
     * the lexToken method, you may find it helpful to have this call other
     * methods like {@code parseTerm()}. In a recursive descent parser, each
     * rule in the grammar would correspond with a {@code parseX()} function.
     *
     * Additionally, here is an example of parsing a function call in a language
     * like Java, which has the form {@code name(args...)}.
     *
     * <pre>
     * {@code
     *     private Ast.FunctionExpr parseFunctionExpr() {
     *         //In a real parser this would be more complex, as the parser
     *         //wouldn't know this should be a function call until reaching the
     *         //opening parenthesis, like name(... <- here. You won't have this
     *         //problem in this project, but will for the compiler project.
     *         if (!match(Token.Type.IDENTIFIER)) {
     *             throw new ParseException("Expected the name of a function.");
     *         }
     *         String name = tokens.get(-1).getLiteral();
     *         if (!match("(")) {
     *             throw new ParseException("Expected opening bra
     *         }
     *         List<Ast> args = new ArrayList<>();
     *         while (!match(")")) {
     *             //recursive call to parseExpr(), not shown here
     *             args.add(parseExpr());
     *             //next token must be a closing parenthesis or comma
     *             if (!peek(")") && !match(",")) {
     *                 throw new ParseException("Expected closing parenthesis or comma after argument.", tokens.get(-1).getIndex());
     *             }
     *         }
     *         return new Ast.FunctionExpr(name, args);
     *     }
     * }
     * </pre>
     */
    private Ast parseAst() throws ParseException
    {
        if(peek("(") || peek("["))
            return parseTerm();

        else if(match(Token.Type.IDENTIFIER))
            return parseIdentifier();

        else if(match(Token.Type.NUMBER))
            return parseNumberLiteral();

        else if(match(Token.Type.STRING))
            return parseStringLiteral();

        else
            throw new ParseException("Error: Unexpected Token", tokens.index);
    }

    Ast.Term parseTerm() throws ParseException
    {
        List<Ast> args = new ArrayList<>();

        if(match("("))
        {
            if(!match(Token.Type.IDENTIFIER))
                throw new ParseException("No Identifier after (", tokens.index);

            String name = parseIdentifier().getName();

            //if(peek(")"))
            //    throw new ParseException("No Ast after Identifier in Term. Case: )", tokens.index);

            while(!match(")"))
                args.add(parseAst());

            return new Ast.Term(name, args);
        }
        else if(match("["))
        {
            if(!match(Token.Type.IDENTIFIER))
                throw new ParseException("No Identifier after [", tokens.index);

            String name = parseIdentifier().getName();

           // if(peek("]"))
           //     throw new ParseException("No Ast after Identifier in Term. Case: ]", tokens.index);

            while(!match("]"))
                args.add(parseAst());

            return new Ast.Term(name, args);
        }
        else
            throw  new ParseException("Error for Term. Shouldn't get here, but to be safe.", tokens.index);
    }

    Ast.Identifier parseIdentifier()
    {
        return new Ast.Identifier(tokens.get(-1).getLiteral());
    }

    Ast.NumberLiteral parseNumberLiteral()
    {
        BigDecimal number = new BigDecimal(tokens.get(-1).getLiteral());
        return new Ast.NumberLiteral(number);
    }

    Ast.StringLiteral parseStringLiteral()
    {
        String noQuotes = tokens.get(-1).getLiteral();
        if(noQuotes.length() == 2)
            return new Ast.StringLiteral("");//edge case where it is an empty string

        noQuotes = noQuotes.substring(1, noQuotes.length() - 1);
        noQuotes = noQuotes.replace("\\n", "\n");
        noQuotes = noQuotes.replace("\\r", "\r");
        noQuotes = noQuotes.replace("\\t", "\t");
        return new Ast.StringLiteral(noQuotes);
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
        int length = patterns.length;

        if(!tokens.has(length))
            return false;

        for(int i = 0; i< length; i++)
        {
            Token type = new Token(tokens.get(i).getType(), "", 0);

            if(!patterns[i].equals(tokens.get(i).getLiteral()) && patterns[i] != type.getType())
                return false;
        }

        return true;
    }

    /**
     * As in the lexer, returns {@code true} if {@link #peek(Object...)} is true
     * and advances the token stream.
     */
    private boolean match(Object... patterns)
    {
        if(!peek(patterns))
            return false;

        int length = patterns.length;

        for(int i = 0; i < length; i++)
            tokens.advance();

        return true;
    }

    private static final class TokenStream
    {

        private final List<Token> tokens;
        private int index = 0;

        private TokenStream(List<Token> tokens) {
            this.tokens = tokens;
        }

        /**
         * Returns true if there is a token at index + offset.
         */
        public boolean has(int offset)
        {
            return index < tokens.size(); //may need to be <= so check later
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
