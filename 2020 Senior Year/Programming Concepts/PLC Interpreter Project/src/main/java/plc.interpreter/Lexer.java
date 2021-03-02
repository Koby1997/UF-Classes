package plc.interpreter;

import java.util.ArrayList;
import java.util.List;

/**
 * The lexer works through three main functions:
 *
 *  - {@link #lex()}, which repeatedly calls lexToken() and skips whitespace
 *  - {@link #lexToken()}, which lexes the next token
 *  - {@link CharStream}, which manages the state of the lexer and literals
 *
 * If the lexer fails to parse something (such as an unterminated string) you
 * should throw a {@link ParseException}.
 *
 * The {@link #peek(String...)} and {@link #match(String...)} functions are
 * helpers, they're not necessary but their use will make the implementation a
 * lot easier. Regex isn't the most performant way to go but it gets the job
 * done, and the focus here is on the concept.
 */
public final class Lexer
{

    final CharStream chars;

    Lexer(String input)
    {
        chars = new CharStream(input);
    }

    /**
     * Lexes the input and returns the list of tokens.
     */
    public static List<Token> lex(String input) throws ParseException
    {
        return new Lexer(input).lex();
    }

    /**
     * Repeatedly lexes the next token using {@link #lexToken()} until the end
     * of the input is reached, returning the list of tokens lexed. This should
     * also handle skipping whitespace.
     */
    List<Token> lex() throws ParseException
    {
        List<Token> myList = new ArrayList<Token>();

        while(chars.has(1))
        {
            if (peek(" \n\r\t")) //whitespace
            {
                chars.advance();
                chars.reset();
                continue;
            }

            myList.add(lexToken());
        }

        return myList;
    }

    /**
     * Lexes the next token. It may be helpful to have this call other methods,
     * such as {@code lexIdentifier()} or {@code lexNumber()}, based on the next
     * character(s).
     *
     * Additionally, here is an example of lexing a character literal (not used
     * in this assignment) using the peek/match methods below.
     *
     * <pre>
     * {@code
     *     Token lexCharacter() {
     *         if (!match("\'")) {
     *             //Your lexer should prevent this from happening, as it should
     *             // only try to lex a character literal if the next character
     *             // begins a character literal.
     *             //Additionally, the index being passed back is a 'ballpark'
     *             // value. If we were doing proper diagnostics, we would want
     *             // to provide a range covering the entire error. It's really
     *             // only for debugging / proof of concept.
     *             throw new ParseException("Next character does not begin a character literal.", chars.index);
     *         }
     *         if (!chars.has(0) || match("\'")) {
     *             throw new ParseException("Empty character literal.",  chars.index);
     *         } else if (match("\\")) {
     *             //lex escape characters...
     *         } else {
     *             chars.advance();
     *         }
     *         if (!match("\'")) {
     *             throw new ParseException("Unterminated character literal.", chars.index);
     *         }
     *         return chars.emit(Token.Type.CHARACTER);
     *     }
     * }
     * </pre>
     */
    Token lexToken() throws ParseException
    {
        if(peek("+-"))
        {

            if(peek("+-", "0123456789")) //+- followed by a number
            {
                match("+-");
                return lexNumber();
            }
            else                            //either single +- or +- and other symbols
                return lexIdentifier();
        }
        else if(peek("."))
        {
            if(peek(".", " \n\r\t"))
                return lexOperator();
            else if(!chars.has(2))
                return lexOperator();
            else if(peek(".", "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ*/:!?<>=-+_0123456789"))
                return lexIdentifier();
            else
                return lexOperator();
        }
        else if (peek("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ*/:!?<>=_"))
            return lexIdentifier();
        else if (peek("0123456789"))
            return lexNumber();
        else if (peek("\""))
            return lexString();
        else
            return lexOperator();
    }

    Token lexIdentifier()
    {
        while(match("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ*/:!?<>=-+_.0123456789"))
        { }
        return chars.emit(Token.Type.IDENTIFIER);
    }

    Token lexNumber()
    {
        while(match("0123456789")) { }
        if(peek(".", "0123456789"))
        {
            match(".");
            while(match("0123456789")){}
        }

        return chars.emit(Token.Type.NUMBER);
    }

    Token lexString() throws ParseException
    {
        match("\"");            //get first quote
        while(!match("\""))     //get everything inside the quotes
        {
            chars.advance();
            if(!chars.has(0))
                throw new ParseException("Unterminated String", chars.index);
            if(peek("\\"))
            {
                if(!peek("\\", "bnrt'\\\""))
                    throw new ParseException("Invalid escape", chars.index);
            }

        }

        match("\"");            //get last quote

        return chars.emit(Token.Type.STRING);
    }

    Token lexOperator() throws ParseException
    {
        if(!peek("()#[]{}@$%^&;,`~'."))
            throw new ParseException("Invalid Operator", chars.index);
        chars.advance();
        return chars.emit(Token.Type.OPERATOR);
    }

    /**
     * Returns true if the next sequence of characters match the given patterns,
     * which should be a regex. For example, {@code peek("a", "b", "c")} would
     * return true for the sequence {@code 'a', 'b', 'c'}
     */
    boolean peek(String... patterns)
    {
        int length = patterns.length;

        if(!chars.has(length))
            return false;

        for(int i = 0; i < length; i++)
        {
            char c = chars.get(i);
            if(patterns[i].indexOf(chars.get(i)) == -1)
                return false;
        }

        return true;
    }

    /**
     * Returns true in the same way as peek, but also advances the CharStream to
     * if the characters matched.
     */
    boolean match(String... patterns)
    {
        int length = patterns.length;

        if(!chars.has(length))
            return false;

        for(int i = 0; i < length; i++)
        {
            if(patterns[i].indexOf(chars.get(i)) == -1)
                return false;
        }

        for(int i = 0; i < length; i++)
            chars.advance();

        return true;
    }

    /**
     * This is basically a sequence of characters. The index is used to maintain
     * where in the input string the lexer currently is, and the builder
     * accumulates characters into the literal value for the next token.
     */
    static final class CharStream
    {

        final String input;
        int index = 0;
        int length = 0;

        CharStream(String input)
        {
            this.input = input;
        }

        /**
         * Returns true if there is a character at index + offset.
         */
        boolean has(int offset)
        {
            return index + offset <= input.length();
        }

        /**
         * Gets the character at index + offset.
         */
        char get(int offset)
        {
            return input.charAt(index + offset);
        }

        /**
         * Advances to the next character, incrementing the current index and
         * length of the literal being built.
         */
        void advance()
        {
            index++;
            length++;
        }

        /**
         * Resets the length to zero, skipping any consumed characters.
         */
        void reset()
        {
            length = 0;
        }

        /**
         * Returns a token of the given type with the built literal and resets
         * the length to zero. The index of the token should be the
         * <em>starting</em> index.
         */
        Token emit(Token.Type type)
        {
            String literal = "";
            for(int i = 0; i < length; i++)
            {
                literal += input.charAt((index - length) + i);
            }
            Token outputToken = new Token(type, literal, (index - length));

            reset();

            return outputToken;
        }

    }

}
