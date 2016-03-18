import string
import sys
import ast

def MyGrader(StudentCode,TestCase):
    class MyVisitor(ast.NodeVisitor):
        def visit_Import(self,stmt_import):
            global found
            found=True

        def visit_Call(self,node):
            global found
            try:
                if(node.func.id=='open'):
                    found=True
            except:
                pass
    
    global found
    found=False
    result='Incorrect'
    node=ast.parse(StudentCode)
    MyVisitor().visit(node)
    print(found)
    if(found!=True):
        code = compile(StudentCode+TestCase, '', 'exec')
        try:
            exec(code)
            if(studentAnswer==correctAnswer):
                result='Correct'
        except:
            result='Incorrect'
    else:
        result='Incorrect'
    return result






