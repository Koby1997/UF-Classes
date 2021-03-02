package plc.compiler;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.Arrays;
import java.util.stream.Stream;

/**
 * Standard JUnit5 parameterized tests. See the RegexTests file from 
 * the interpreter part 1 for more information.
 */
final class LexerTests {

    @ParameterizedTest
    @MethodSource
    void testIdentifier(String input, boolean success) {
        test(input, Token.Type.IDENTIFIER, success);
    }

    private static Stream<Arguments> testIdentifier() {
        return Stream.of(
                Arguments.of("getName", true),
                Arguments.of("is-empty?", false),
                Arguments.of("<=>", false),
                Arguments.of("42=life", false),
                Arguments.of("why,are,there,commas,", false),
                Arguments.of("numbers456", true),
                Arguments.of("Space Here", false)
        );
    }

    @ParameterizedTest
    @MethodSource
    void testInteger(String input, boolean success) {
        test(input, Token.Type.INTEGER, success);
    }

    private static Stream<Arguments> testInteger() {
        return Stream.of(
                Arguments.of("1", true),
                Arguments.of("11", true),
                Arguments.of("-1.0", false),
                Arguments.of("007.000", false),
                Arguments.of("1.", false),
                Arguments.of(".5", false),
                Arguments.of("0123", true),
                Arguments.of("9876543210", true)
        );
    }

    @ParameterizedTest
    @MethodSource
    void testDecimal(String input, boolean success) {
        test(input, Token.Type.DECIMAL, success);
    }

    private static Stream<Arguments> testDecimal() {
        return Stream.of(
                Arguments.of("1", false),
                Arguments.of("11", false),
                Arguments.of("-1.0", false),
                Arguments.of("007.000", true),
                Arguments.of("1.", false),
                Arguments.of(".5", false),
                Arguments.of("0123", false),
                Arguments.of("9876543210", false),
                Arguments.of("9876543210.0123456789", true)
        );
    }

    @ParameterizedTest
    @MethodSource
    void testString(String input, boolean success) {
        test(input, Token.Type.STRING, success);
    }

    private static Stream<Arguments> testString() {
        return Stream.of(
                Arguments.of("\"\"", true),
                Arguments.of("\"abc\"", true),
                Arguments.of("\"Hello,\\nWorld\"", true),
                Arguments.of("\"unterminated", false),
                Arguments.of("\"invalid\\escape\"", true),
                Arguments.of("\"escaped\\\"quote\"", false),
                Arguments.of("\"This has spaces in it\"", true),
                Arguments.of("\"Numbers1234567890here\"", true)
        );
    }

    @ParameterizedTest
    @MethodSource
    void testOperator(String input, boolean success) {
        test(input, Token.Type.OPERATOR, success);
    }

    private static Stream<Arguments> testOperator() {
        return Stream.of(
                Arguments.of("==", true),
                Arguments.of("!=", true),
                Arguments.of("\"Hello,\\nWorld\"", false),
                Arguments.of("\"unterminated", true),
                Arguments.of("\"invalid\\escape\"", false),
                Arguments.of("1", false),
                Arguments.of("{", true)
        );
    }

    /**
     * Tests that the input lexes to the (single) expected token if successful,
     * else throws a {@link ParseException} otherwise.
     */
    private static void test(String input, Token.Type expected, boolean success) {
        try {
            if (success) {
                Assertions.assertEquals(Arrays.asList(new Token(expected, input, 0)), Lexer.lex(input));
            } else {
                Assertions.assertNotEquals(Arrays.asList(new Token(expected, input, 0)), Lexer.lex(input));
            }
        } catch (ParseException e) {
            Assertions.assertFalse(success, e.getMessage());
        }
    }

}
