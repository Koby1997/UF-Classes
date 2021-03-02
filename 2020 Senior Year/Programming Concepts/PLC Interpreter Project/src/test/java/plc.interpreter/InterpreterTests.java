package plc.interpreter;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Collections;
import java.util.Map;
import java.util.stream.Stream;

final class InterpreterTests {

    @Test
    void testTerm() {
        test(new Ast.Term("print", Arrays.asList()), Interpreter.VOID, Collections.emptyMap());
    }

    @Test
    void testIdentifier() {
        test(new Ast.Identifier("num"), 10, Collections.singletonMap("num", 10));
    }

    @Test
    void testNumber() {
        test(new Ast.NumberLiteral(BigDecimal.ONE), BigDecimal.ONE, Collections.emptyMap());
    }

    @Test
    void testString() {
        test(new Ast.StringLiteral("string"), "string", Collections.emptyMap());
    }

    @ParameterizedTest
    @MethodSource
    void testAddition(String test, Ast ast, BigDecimal expected) {
        test(ast, expected, Collections.emptyMap());
    }

    private static Stream<Arguments> testAddition() {
        return Stream.of(
                Arguments.of("Zero Arguments", new Ast.Term("+", Arrays.asList()), BigDecimal.valueOf(0)),
                Arguments.of("Multiple Arguments", new Ast.Term("+", Arrays.asList(
                        new Ast.NumberLiteral(BigDecimal.ONE),
                        new Ast.NumberLiteral(BigDecimal.valueOf(2)),
                        new Ast.NumberLiteral(BigDecimal.valueOf(3))
                )), BigDecimal.valueOf(6))
        );
    }

    @ParameterizedTest
    @MethodSource
    void testSubtraction(String test, Ast ast, BigDecimal expected) {
        test(ast, expected, Collections.emptyMap());
    }

    private static Stream<Arguments> testSubtraction() {
        return Stream.of(
                Arguments.of("Zero Arguments", new Ast.Term("-", Arrays.asList()), null),
                Arguments.of("Single Argument", new Ast.Term("-", Arrays.asList(
                        new Ast.NumberLiteral(BigDecimal.ONE)
                )), BigDecimal.valueOf(-1)),
                Arguments.of("Multiple Arguments", new Ast.Term("-", Arrays.asList(
                        new Ast.NumberLiteral(BigDecimal.ONE),
                        new Ast.NumberLiteral(BigDecimal.valueOf(2)),
                        new Ast.NumberLiteral(BigDecimal.valueOf(3))
                )), BigDecimal.valueOf(-4))
        );
    }

    @ParameterizedTest
    @MethodSource
    void testAnd(String test, Ast ast, boolean expected) {
        test(ast, expected, Collections.emptyMap());
    }

    private static Stream<Arguments> testAnd() {
        return Stream.of(
                Arguments.of("(and true false true)", new Ast.Term("and", Arrays.asList(
                        new Ast.Identifier("true"),
                        new Ast.Identifier("false"),
                        new Ast.Identifier("true")
                )), false),
                Arguments.of("(and true false invalid)", new Ast.Term("and", Arrays.asList(
                        new Ast.Identifier("true"),
                        new Ast.Identifier("false"),
                        new Ast.Identifier("invalid")
                )), false)
        );
    }

    @ParameterizedTest
    @MethodSource
    void testOr(String test, Ast ast, boolean expected) {
        test(ast, expected, Collections.emptyMap());
    }

    private static Stream<Arguments> testOr() {
        return Stream.of(
                Arguments.of("(or false true false)", new Ast.Term("or", Arrays.asList(
                        new Ast.Identifier("true"),
                        new Ast.Identifier("false"),
                        new Ast.Identifier("true")
                )), true),
                Arguments.of("(or false true invalid)", new Ast.Term("or", Arrays.asList(
                        new Ast.Identifier("true"),
                        new Ast.Identifier("false"),
                        new Ast.Identifier("invalid")
                )), true)
        );
    }

    @ParameterizedTest
    @MethodSource
    void testLessThan(String test, Ast ast, boolean expected) {
        test(ast, expected, Collections.emptyMap());
    }

    private static Stream<Arguments> testLessThan() {
        return Stream.of(
                Arguments.of("< 0 1 10)", new Ast.Term("<", Arrays.asList(
                        new Ast.NumberLiteral(BigDecimal.valueOf(0)),
                        new Ast.NumberLiteral(BigDecimal.valueOf(1)),
                        new Ast.NumberLiteral(BigDecimal.valueOf(10))
                )), true),
                Arguments.of("(< \"x\" \"z\" \"y\")", new Ast.Term("<", Arrays.asList(
                        new Ast.StringLiteral("\"x\""),
                        new Ast.StringLiteral("\"z\""),
                        new Ast.StringLiteral("\"y\"")
                )), false)
        );
    }

    @ParameterizedTest
    @MethodSource
    void testLessThanOrEqual(String test, Ast ast, boolean expected) {
        test(ast, expected, Collections.emptyMap());
    }

    private static Stream<Arguments> testLessThanOrEqual() {
        return Stream.of(
                Arguments.of("<= 0 1 10)", new Ast.Term("<=", Arrays.asList(
                        new Ast.NumberLiteral(BigDecimal.valueOf(0)),
                        new Ast.NumberLiteral(BigDecimal.valueOf(1)),
                        new Ast.NumberLiteral(BigDecimal.valueOf(10))
                )), true),
                Arguments.of("(<= \"x\" \"z\" \"y\")", new Ast.Term("<=", Arrays.asList(
                        new Ast.StringLiteral("\"x\""),
                        new Ast.StringLiteral("\"z\""),
                        new Ast.StringLiteral("\"y\"")
                )), false),
                Arguments.of("<= 1 1)", new Ast.Term("<=", Arrays.asList(
                        new Ast.NumberLiteral(BigDecimal.valueOf(1)),
                        new Ast.NumberLiteral(BigDecimal.valueOf(1))
                )), true)
        );
    }

    @ParameterizedTest
    @MethodSource
    void testGreaterThan(String test, Ast ast, boolean expected) {
        test(ast, expected, Collections.emptyMap());
    }

    private static Stream<Arguments> testGreaterThan() {
        return Stream.of(
                Arguments.of("< 10 1 0)", new Ast.Term(">", Arrays.asList(
                        new Ast.NumberLiteral(BigDecimal.valueOf(10)),
                        new Ast.NumberLiteral(BigDecimal.valueOf(1)),
                        new Ast.NumberLiteral(BigDecimal.valueOf(0))
                )), true),
                Arguments.of("(> \"x\" \"z\" \"y\")", new Ast.Term("<", Arrays.asList(
                        new Ast.StringLiteral("\"x\""),
                        new Ast.StringLiteral("\"z\""),
                        new Ast.StringLiteral("\"y\"")
                )), false)
        );
    }

    @ParameterizedTest
    @MethodSource
    void testGreaterThanOrEqual(String test, Ast ast, boolean expected) {
        test(ast, expected, Collections.emptyMap());
    }

    private static Stream<Arguments> testGreaterThanOrEqual() {
        return Stream.of(
                Arguments.of(">= 10 1 0)", new Ast.Term(">=", Arrays.asList(
                        new Ast.NumberLiteral(BigDecimal.valueOf(10)),
                        new Ast.NumberLiteral(BigDecimal.valueOf(1)),
                        new Ast.NumberLiteral(BigDecimal.valueOf(0))
                )), true),
                Arguments.of("(>= \"x\" \"z\" \"y\")", new Ast.Term(">=", Arrays.asList(
                        new Ast.StringLiteral("\"x\""),
                        new Ast.StringLiteral("\"z\""),
                        new Ast.StringLiteral("\"y\"")
                )), false),
                Arguments.of(">= 1 1)", new Ast.Term(">=", Arrays.asList(
                        new Ast.NumberLiteral(BigDecimal.valueOf(1)),
                        new Ast.NumberLiteral(BigDecimal.valueOf(1))
                )), true)
        );
    }

    private static void test(Ast ast, Object expected, Map<String, Object> map) {
        Scope scope = new Scope(null);
        map.forEach(scope::define);
        Interpreter interpreter = new Interpreter(new PrintWriter(System.out), scope);
        if (expected != null) {
            Assertions.assertEquals(expected, interpreter.eval(ast));
        } else {
            Assertions.assertThrows(EvalException.class, () -> interpreter.eval(ast));
        }
    }

}
