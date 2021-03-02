package plc.interpreter;

import java.util.regex.Pattern;

/**
 * Contains {@link Pattern} constants, which are compiled regular expressions.
 * See the assignment page for resources on regex's as needed.
 */
public class Regex {

    public static final Pattern
            EMAIL = Pattern.compile("[A-Za-z0-9._-]+@[A-Za-z0-9-]*\\.[a-z]{2,3}"),
            FILE_NAMES = Pattern.compile("(?<name>[^.]+)\\.((((java|class)|([^.]+\\.))+)(|(\\.|[^.]+\\.)))+"),
            EVEN_STRINGS = Pattern.compile("([ -~]{2}){5,10}"), //any 2 characters, 5 to 10 times.
            INTEGER_LIST = Pattern.compile("\\[(|(([0-9]+)(|(|([,]( )?([0-9]+)))+)))\\]"),
            IDENTIFIER = Pattern.compile("(([\\.][a-zA-Z0-9_\\+\\-\\*\\/\\.:!\\?<>=])|[a-zA-Z_\\+\\-\\*\\/:!\\?<>=])(|[a-zA-Z0-9_\\+\\-\\*\\/\\.:!\\?<>=]*)"),
            NUMBER = Pattern.compile("([+-][0-9]+|[0-9]+)(|[.][0-9]+)"),
            STRING = Pattern.compile("[\"]([^\"\\\\]|[\\\\][bnrt'\"\\\\])*[\"]");

}
//Tried to use back referencing for some (mainly Identifier) to not make it so long but I couldn't get it to work right
