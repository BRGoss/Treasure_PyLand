import string
import argparse
import sys
import ast

debug=False
class MyVisitor(ast.NodeVisitor):
    def __init__(self):
        self.found = False
        self.defCount=0
        
    def visit_Import(self,stmt_import):
        self.found=True
        return

    def visit_FunctionDef(self,node):
        self.defCount+=1
        for item in range(len(node.body)):
            ast.NodeVisitor.generic_visit(self, node.body[item])
            try:
                finder=node.body[item].name
                self.defCount+=1
            except:
                try:
                    if node.body[item].value.func.id in ('open','compile','exec','eval'):
                        self.found=True
                except:
                    pass
            if self.defCount > 1:
                self.found=True
    def visit_Call(self,node):
        try:
            if node.func.id in ('open','compile','exec','eval'):
                self.found=True
        except:
            pass
           
    def visit_Expr(self,node):
        try:
            if node.value.args[0].value.id=='sys':
                self.found=True
        except:
            try:
                if node.value.func.id in ('open','compile','exec','eval'):
                    self.found=True
            except:
                pass   

def MyGrader(the_code):
    result='Incorrect'
    node=ast.parse(the_code)
    myVisitor=MyVisitor()
    myVisitor.visit(node)
    if not myVisitor.found:
        code = compile(the_code, '', 'exec')
        try:
            exec(code)
            result=locals()['studentAnswer']
        except:
            result='INCORRECT - '+(str)(sys.exc_info()[1])
            return result
    else:
        result='VIOLATION'
    return result

def driver():
    parser = argparse.ArgumentParser()
    parser.add_argument("student_code", help="The string containing the student's code")
    parser.add_argument("test_case", help="The string containing the test case")
    args = parser.parse_args()
    try:
        student_code=open(args.student_code).read()
    except:
        student_code=args.student_code
    student_code=student_code.replace('\\n','\n')
    student_code=student_code.replace('\\t','    ')
    theDef=''
    if student_code[:3]!='def':
        theArguments=student_code.split('def')
        theDef=theArguments[1]
        theDef=theDef.split()[0]
        theDef=theDef.split('(')[0]
    else:
        theArguments=student_code.split(':')
        theDef=theArguments[0]
        theDef=theDef.split()[1]
        theDef=theDef.split('(')[0]
    test_case = 'studentAnswer='+theDef+'('+args.test_case+')'
    theCode=student_code+"\n"+test_case
    global debug
    if debug:
        print(theCode)
    try:
        test_code=open(args.test_case).read()
    except:
        test_code=args.test_case
    test_case = 'studentAnswer='+theDef+'('+test_code+')'
    theCode=student_code+test_case
    #print(theCode)

    return MyGrader(theCode)
    
print(driver())
