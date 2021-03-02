package plc.compiler;

import java.io.PrintWriter;

public final class Generator implements Ast.Visitor<Void> {

    private final PrintWriter writer;
    private int indent = 0;

    public Generator(PrintWriter writer)
    {
        this.writer = writer;
    }

    private void print(Object... objects)
    {
        for (Object object : objects)
        {
            if (object instanceof Ast)
            {
                visit((Ast) object);
            }
            else
            {
                writer.write(object.toString());
            }
        }
    }

    private void newline(int indent)
    {
        writer.println();
        for (int i = 0; i < indent; i++)
        {
            writer.write("    ");
        }
    }

    @Override
    public Void visit(Ast.Source ast)
    {
        print("public final class Main {");
        newline(indent);
        newline(++indent);
        print("public static void main(String[] args) {");
        newline(++indent);
        for(int i = 0; i < ast.getStatements().size(); i++)
        {
            print(ast.getStatements().get(i));
            if(i + 1 < ast.getStatements().size())
                newline(indent);
        }
        newline(--indent);
        print("}");
        newline(--indent);
        newline(indent);
        print("}");
        newline(indent);

        return null;
    }

    @Override
    public Void visit(Ast.Statement.Expression ast)
    {
        print(ast.getExpression(), ";");
        return null;
    }

    @Override
    public Void visit(Ast.Statement.Declaration ast)
    { //TYPE name = value;

        // write: TYPE variable_name

        //is there assigned value?
        //if so, write: =, then value

        //write: ;

        print(ast.getType(), " ", ast.getName());

        if(ast.getValue().isPresent())
        {
            print(" = ", ast.getValue().get());
        }

        print(";");

        return null;
    }

    @Override
    public Void visit(Ast.Statement.Assignment ast)
    { //name = value;

        print(ast.getName(), " = ", ast.getExpression(), ";");

        return null;
    }

    @Override
    public Void visit(Ast.Statement.If ast)
    {

        print("if (");
        print(ast.getCondition(), ")");
        if(ast.getThenStatements().isEmpty())
        {
            print(" {}");
        }
        else
        {
            print(" {");
            newline(++indent);
            for(int i = 0; i< ast.getThenStatements().size(); i++)
            {
                print(ast.getThenStatements().get(i));
                if(i + 1 < ast.getThenStatements().size())
                    newline(indent);
            }
            newline(--indent);
            print("}");
        }

        if(!ast.getElseStatements().isEmpty())
        {
            print(" else {");
            newline(++indent);
            for(int i = 0; i< ast.getElseStatements().size(); i++)
            {
                print(ast.getElseStatements().get(i));
                if(i + 1 < ast.getElseStatements().size())
                    newline(indent);
            }
            newline(--indent);
            print("}");
        }

        return null;
    }

    @Override
    public Void visit(Ast.Statement.While ast)
    {

        print("while (", ast.getCondition(), ")");
        if(ast.getStatements().isEmpty())
        {
            print( " {}");
        }
        else
        {
            print(" {");
            newline(++indent);
            for(int i = 0; i< ast.getStatements().size(); i++)
            {
                print(ast.getStatements().get(i));
                if(i + 1 < ast.getStatements().size())
                    newline(indent);
            }
            newline(--indent);
            print("}");
        }

        return null;
    }

    @Override
    public Void visit(Ast.Expression.Literal ast)
    {
        if(ast.getValue() instanceof String)
            print("\"", ast.getValue(), "\"");
        else
            print(ast.getValue());

        return null;
    }

    @Override
    public Void visit(Ast.Expression.Group ast)
    {

        print("(", ast.getExpression(), ")");
        return null;
    }

    @Override
    public Void visit(Ast.Expression.Binary ast)
    {
        print(ast.getLeft(), " ", ast.getOperator(), " ", ast.getRight());
        return null;
    }

    @Override
    public Void visit(Ast.Expression.Variable ast)
    {
        print(ast.getName());

        return null;
    }

    @Override
    public Void visit(Ast.Expression.Function ast)
    {
        print(ast.getName(), "(");
        for(int i = 0; i < ast.getArguments().size(); i++)
        {
            print(ast.getArguments().get(i));
            if(i != ast.getArguments().size() - 1) // last element
            {
                print(", ");
            }
        }
        print(")");

        return null;
    }

}
