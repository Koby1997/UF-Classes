//package plc.interpreter;
//
//import org.junit.jupiter.api.Assertions;
//import org.junit.jupiter.params.ParameterizedTest;
//import org.junit.jupiter.params.provider.Arguments;
//import org.junit.jupiter.params.provider.MethodSource;
//
//import java.util.regex.Matcher;
//import java.util.regex.Pattern;
//import java.util.stream.Stream;
//
///**
// * Contains JUnit tests for {@link Regex}. Tests declarations for steps 1 & 2
// * are provided, you must add your own for step 3.
// *
// * To run tests, either click the run icon on the left margin or execute the
// * gradle test task, which can be done by clicking the Gradle tab in the right
// * sidebar and navigating to Tasks > verification > test Regex(double click to run).
// */
//public class RegexTests {
//
//    /**
//     * This is a parameterized test for the {@link Regex#EMAIL} regex. The
//     * {@link ParameterizedTest} annotation defines this method as a
//     * parameterized test, and {@link MethodSource} tells JUnit to look for the
//     * static method {@link #testEmailRegex()}.
//     *
//     * For personal preference, I include a test name as the first parameter
//     * which describes what that test should be testing - this is visible in
//     * IntelliJ when running the tests.
//     */
//    @ParameterizedTest
//    @MethodSource
//    public void testEmailRegex(String test, String input, boolean success) {
//        test(input, Regex.EMAIL, success);
//    }
//
//    /**
//     * This is the factory method providing test cases for the parameterized
//     * test above - note that it is static, takes no arguments, and has the same
//     * name as the test. The {@link Arguments} object contains the arguments for
//     * each test to be passed to the function above
//     */
//    public static Stream<Arguments> testEmailRegex() {
//        return Stream.of(
//                Arguments.of("Alphanumeric", "thelegend27@gmail.com", true),
//                Arguments.of("UF Domain", "otherdomain@ufl.edu", true),
//                Arguments.of("Missing Domain Dot", "missingdot@gmailcom", false),
//                Arguments.of("Symbols", "symbols#$%@gmail.com", false),         //mine start below
//                Arguments.of("Spaces", " this@ hasSpaces. abc", false),         //some random tests
//                Arguments.of("Nothing", "@.", false),
//                Arguments.of("Literally Nothing", "", false),
//                Arguments.of("Blank before @", "@yahoo.com", false),            //testing things with @
//                Arguments.of("Extra @", "extra@@ufl.edu", false),
//                Arguments.of("No @", "itsmissing.com", false),
//                Arguments.of("Short end", "normalsize@stillnormal.a", false),   //testing last section
//                Arguments.of("Long end", "normalsize@stillnormal.toolong", false),
//                Arguments.of("Numbers at the end", "Notcorrect@because.123", false),
//                Arguments.of("Symbols at the end", "Notcorrect@because.-_-", false),
//                Arguments.of("Extra Dot", "Double@trouble..co", false),
//                Arguments.of("Capitals at the end", "Normal@gmail.COM", false),
//                Arguments.of("Really short", "a@b.cd", true),                   //tests that should pass
//                Arguments.of("Correct Symbols", "._--_.@--.edu", true),
//                Arguments.of("Can't be too safe haha","ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890.-_@ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890-.com", true),
//                Arguments.of("My Email", "kobz1997@ufl.edu", true)
//        );
//    }
//
//    @ParameterizedTest
//    @MethodSource
//    public void testFileNamesRegex(String test, String input, boolean success) {
//        //this one is different as we're also testing the file name capture
//        Matcher matcher = test(input, Regex.FILE_NAMES, success);
//        if (success) {
//            Assertions.assertEquals(input.substring(0, input.indexOf(".")), matcher.group("name"));
//        }
//    }
//
//    public static Stream<Arguments> testFileNamesRegex() {
//        return Stream.of(
//                Arguments.of("Java File", "Regex.tar.java", true),
//                Arguments.of("Java Class", "RegexTests.class", true),
//                Arguments.of("Directory", "directory", false),
//                Arguments.of("Python File", "scrippy.py", false),//mine start below
//                Arguments.of("Number name", "1234567890.java", true),
//                Arguments.of("Short name", "a.class", true),
//                Arguments.of("Symbol name", "!@#$%^&*().java", true),
//                Arguments.of("A lot of .s", "one.two.three.four.java", true),
//                Arguments.of("nothing in front of .", ".class", false),
//                Arguments.of("No ending", "filename.", false),
//                Arguments.of("only periods", ".....java", false),
//                Arguments.of("Name and periods", "name.......class", false),
//                Arguments.of("Junk after .java", "start.javajunk", false),
//                Arguments.of("Junk after .class, but correct", "start.classjunk.class", true),
//                Arguments.of(".class in the middle", "beginning.class.java", true),
//                Arguments.of(".class in middle, wrong end", "beginning.class.pdf", false),
//                Arguments.of("Lots of java", "java.java.java.java.java.java", true),
//                Arguments.of("Reverse of correct", "java.name", false),
//                Arguments.of("Spaces", "space in the middle.java", true),
//                Arguments.of("Space after .java", "Letsgo.java ", false),
//                Arguments.of("Literally nothing", "", false),
//                Arguments.of("Misspelled ending", "name.jaav", false)
//        );
//    }
//
//    @ParameterizedTest
//    @MethodSource
//    public void testEvenStringsRegex(String test, String input, boolean success) {
//        test(input, Regex.EVEN_STRINGS, success);
//    }
//
//    public static Stream<Arguments> testEvenStringsRegex() {
//        return Stream.of(
//                Arguments.of("14 Characters", "thishas14chars", true),
//                Arguments.of("10 Characters", "i<3pancakes!", true),
//                Arguments.of("6 Characters", "6chars", false),
//                Arguments.of("15 Characters", "i<3pancakes!!", false),  //mine start below
//                Arguments.of("20 Characters", "ABCDEFGHIJKLMNOPQRST", true),
//                Arguments.of("20 only symbols (with space at end)", "!@#$%^&*()_+=-][}{| ", true),  // making sure all symbols work
//                Arguments.of("12 more symbols", ";:',.<>/?`~!", true),
//                Arguments.of("Numbers", "1234567890", true),
//                Arguments.of("21 Over odd", "twentyonecharacters21", false),
//                Arguments.of("22 Over even", "twentytwocharacters_22", false),
//                Arguments.of("2 Characters", "12", false),
//                Arguments.of("Literally Nothing", "", false),           //below, checking if literal counts the \
//                Arguments.of("Literal quote with 11 other characters", "123456789_\"_", true), //"other characters" does not include \
//                Arguments.of("Literal backslash 8 with other characters", "12345678\"", false) //"other characters does not include the \
//        );
//    }
//
//    @ParameterizedTest
//    @MethodSource
//    public void testIntegerListRegex(String test, String input, boolean success) {
//        test(input, Regex.INTEGER_LIST, success);
//    }
//
//    public static Stream<Arguments> testIntegerListRegex() {
//        return Stream.of(
//                Arguments.of("Empty List", "[]", true),
//                Arguments.of("Single Element", "[1]", true),
//                Arguments.of("Multiple Elements", "[1,2,3]", true),
//                Arguments.of("Missing Brackets", "1,2,3", false),
//                Arguments.of("Missing Commas", "[1 2 3]", false),
//                Arguments.of("Trailing Comma", "[1,2,3,]", false),      // mine start below
//                Arguments.of("Start with comma", "[,1,2,3]", false),
//                Arguments.of("Missing , in middle", "[1,2,3,,5,6]", false),
//                Arguments.of("Letters", "[a,b,c]", false),
//                Arguments.of("Symbols", "[!,@,#]", false),
//                Arguments.of("Only space", "[ ]", false),               //testing spaces
//                Arguments.of("Extra spaces", "[1,2, 3,  4,   5]", false),
//                Arguments.of("Mix spaces", "[1, 2,3,4, 5, 6]", true),
//                Arguments.of("Space after each comma", "[1, 2, 3]", true),
//                Arguments.of("Literally nothing", "", false),
//                Arguments.of("Wrong Brackets", "{1,2,3}", false),       //testing brackets
//                Arguments.of("Extra end Bracket", "[1,2,3]]", false),
//                Arguments.of("Negative numbers", "[-1,-2,3,-4]", false),//non-integers
//                Arguments.of("Decimal numbers", "[1.1,1.2,1.3]", false),
//                Arguments.of("0 decimals", "[0.1,0.2,0.3]", false),
//                Arguments.of("Numbers starting with 0", "[01,02,03,4,5]", true),//originally I made it so this would fail. I didn't like the 0's
//                Arguments.of("Mixed starting with 0", "[1,2,03,04,5]", true),
//                Arguments.of("0 By itself", "[0,0,0,10,110,2,3,4,5]", true),
//                Arguments.of("Really long", "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]", true),
//                Arguments.of("Large numbers", "[10,11,12,333,4444,55555]", true),
//                Arguments.of("Every number", "[1234567890, 1234567890]", true),
//                Arguments.of("1 large number", "[1111]", true)
//        );
//    }
//
//    @ParameterizedTest
//    @MethodSource
//    public void testIdentifierRegex(String test, String input, boolean success) {
//        test(input, Regex.IDENTIFIER, success);
//    }
//
//    public static Stream<Arguments> testIdentifierRegex() {
//        return Stream.of(
//                Arguments.of("getName", "getName", true),
//                Arguments.of("is-empty?", "is-empty", true),
//                Arguments.of("<=>", "<=>", true),
//                Arguments.of("Number at start", "42=life", false),
//                Arguments.of("Commas", "why,are,there,commas,", false),//mine start below
//                Arguments.of("Literally nothing", "", false),//don't know if this should pass, will ask in OH
//                Arguments.of("All symbols", "_+-*/.:!?<>=", true),
//                Arguments.of("Numbers in middle", "start1234567890end", true),
//                Arguments.of("Numbers at end", ":<>=0123456789", true),
//                Arguments.of("Only period", ".", false),
//                Arguments.of("Incorrect symbols", "@#$%^&()", false),
//                Arguments.of("Spaces", "this has spaces", false),
//                Arguments.of("Capital and lowercase", "BIGsmall", true),
//                Arguments.of("Just number", "11", false),
//                Arguments.of(". then number", ".11", true)
//        );
//    }
//
//    @ParameterizedTest
//    @MethodSource
//    public void testNumberRegex(String test, String input, boolean success) {
//        test(input, Regex.NUMBER, success);
//    }
//
//    public static Stream<Arguments> testNumberRegex() {
//        return Stream.of(
//                Arguments.of("Just 1", "1", true),
//                Arguments.of("Negative decimal", "-1.0", true),
//                Arguments.of("Long decimal", "007.000", true),
//                Arguments.of("Nothing after .", "1.", false),
//                Arguments.of("Nothing before .", ".5", false),//mine start below
//                Arguments.of("Literally Nothing", "", false),
//                Arguments.of("Only +", "+", false),
//                Arguments.of("+ and _", "+-15", false),
//                Arguments.of("Words", "Why would this work", false),
//                Arguments.of("Symbols", "!?!@#$*/", false),
//                Arguments.of("Multiple decimal points", "123.123.123", false),
//                Arguments.of("Large positive number", "+9876543210", true),
//                Arguments.of("Small decimal number", "-0.000000000000456", true),
//                Arguments.of("Symbol in the middle", "1234+56789", false),
//                Arguments.of("+ at end", "55+", false),
//                Arguments.of("Just because its funny", "-0", true)
//        );
//    }
//
//    @ParameterizedTest
//    @MethodSource
//    public void testStringRegex(String test, String input, boolean success) {
//        test(input, Regex.STRING, success);
//    }
//
//    public static Stream<Arguments> testStringRegex() {
//        return Stream.of(
//                Arguments.of("Literally Nothing", "\"\"", true),
//                Arguments.of("abc", "\"abc\"", true),
//                Arguments.of("Hello,World", "\"Hello,\\nWorld\"", true),
//                Arguments.of("Unterminated", "\"unterminated", false),
//                Arguments.of("Invalid escape", "\"invalid\\escape\"", false),//mine start below
//                Arguments.of("No quotes", "This has no literal quotes", false),
//                Arguments.of("Odd Backslashes", "\"\\\\\\\"", false),       //remember we need literal, so '1' backslash = 2 typed backslashes
//                Arguments.of("Even Backslashes", "\"\\\\\\\\\"", true),     //don't count needed \ for quotes
//                Arguments.of("Double quotes in middle with no literal", "\"Random quote \" in the middle\"", false),
//                Arguments.of("Extra end quote", "\"Two quotes at the end\"\"", false),
//                Arguments.of("Numbers", "\"1234567890\"", true),
//                Arguments.of("Symbols", "\"!@#$%^&*()_+-=\"", true),
//                Arguments.of("Multiple literal", "\"one \\b two \\t\"", true),
//                Arguments.of("All literals", "\" \\b \\n \\r \\t \\' \\\" \\\\ \"", true),//complicated haha
//                Arguments.of("Lets see how complicated this can get", "\"\\\"\\\"\\\"\\\"\\\"\"", true),
//                Arguments.of("Actually nothing", "", false),
//                Arguments.of("Only backslash", "\"\\\"", false)
//        );
//    }
//
//
//    /**
//     * Asserts that the input matches the given pattern and returns the matcher
//     * for additional assertions.
//     */
//    private static Matcher test(String input, Pattern pattern, boolean success) {
//        Matcher matcher = pattern.matcher(input);
//        Assertions.assertEquals(success, matcher.matches());
//        return matcher;
//    }
//
//}
//