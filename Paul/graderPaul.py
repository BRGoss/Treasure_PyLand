import argparse
import sys
import ast
import math

debug=False
class MyVisitor(ast.NodeVisitor):
    def __init__(self):
        self.found = False
        self.defCount=0
        self.errorMessage=''
        
    def visit_Import(self,node):
        self.found=True
        self.errorMessage='import statement found'
        return

    def visit_ClassDef(self,node):
        self.found=True
        self.errorMessage='class found'
        return
        
    def visit_FunctionDef(self,node):
        self.defCount+=1
        for item in range(len(node.body)):
            ast.NodeVisitor.visit(self,node.body[item])
        if self.defCount > 1:
            self.found=True
            self.errorMessage='multiple defs found'
            
    def visit_Call(self,node):
        if hasattr(node.func,'value'):
            if hasattr(node.func.value,'s'):
                ast.NodeVisitor.visit(self,node.func.value)
            else:
                for item in range(len(node.args)):
                    ast.NodeVisitor.visit(self,node.args[item])
        elif hasattr(node.func,'id'):
            if node.func.id in ('open','compile','exec','eval'):
                self.found=True
                self.errorMessage='use of illegal command found'
            else:
                for item in range(len(node.args)):
                    try:
                        ast.NodeVisitor.visit(self,node.args[item])
                    except:
                        pass
           
    def visit_Expr(self,node):
        ast.NodeVisitor.visit(self,node.value)
        
    def visit_Return(self,node):
        ast.NodeVisitor.visit(self,node.value)
    
    def visit_Assign(self,node):
        ast.NodeVisitor.visit(self,node.value)
    
    def visit_Str(self,node):
        if len(node.s) > 1:
                self.found=True
                self.errorMessage='String literal longer than 1 found' 
                
                   
def MyGrader(student_code,test_case):
    result=''
    node=ast.parse(student_code)
    myVisitor=MyVisitor()
    myVisitor.visit(node)
    if not myVisitor.found:
        code = compile(student_code, '', 'exec')
        try:
            theCode=student_code+"\n"+test_case
            fullCode=compile(theCode,'','exec')
            exec(fullCode)
            result=locals()['studentAnswer']
        except:
            result='INCORRECT - '+str(sys.exc_info()[1])
            return result
    else:
        result='ERROR - '+myVisitor.errorMessage
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
    global debug
    if debug:
        print(theCode)
    try:
        test_code=open(args.test_case).read()
    except:
        test_code=args.test_case
    test_case = 'studentAnswer='+theDef+'('+test_code+')'

    return MyGrader(student_code,test_case)
    
print(driver())
