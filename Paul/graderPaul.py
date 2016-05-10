import argparse
import sys
import ast
import math

debug=False
class MyVisitor(ast.NodeVisitor):
    def __init__(self):
        self.found = False #checks for violations
        self.defCount=0    #checks for multiple defs
        self.errorMessage='' #used to create custom error message
        
    def visit_Import(self,node): #checks for imports
        self.found=True          # no need for any imports
        self.errorMessage='import statement found'
        return

    def visit_ClassDef(self,node): #checks for classes
        self.found=True            #no need for any classes
        self.errorMessage='class found'
        return
        
    def visit_FunctionDef(self,node): #checks for multiple defs
        self.defCount+=1              #adds one to defCount. Should be one
        for item in range(len(node.body)): #checks each line of code in def, looking for embedded defs
            ast.NodeVisitor.visit(self,node.body[item])  #visit the each node in the body. Other functions handle most of this
        if self.defCount > 1:         
            self.found=True   #no need for multiple defs
            self.errorMessage='multiple defs found'
            
    def visit_Call(self,node):   #checks for calls we don't want the student to use(open,compile,exec,eval)
        if hasattr(node.func,'value'): #node.func has either value or id attribute
            if hasattr(node.func.value,'s'): #if value is a string, string function handles it
                ast.NodeVisitor.visit(self,node.func.value)
            else:
                for item in range(len(node.args)):
                    ast.NodeVisitor.visit(self,node.args[item]) #checks arguments, mostly for print statements
        elif hasattr(node.func,'id'):
            if node.func.id in ('open','compile','exec','eval'): #checks function call names
                self.found=True                                  #denies use of open,compile,exec,eval
                self.errorMessage='use of illegal command found'
            else:
                for item in range(len(node.args)): #otherwise, check arguments
                    try:
                        ast.NodeVisitor.visit(self,node.args[item])
                    except:
                        pass
           
    def visit_Expr(self,node):
        ast.NodeVisitor.visit(self,node.value) #passes along to next portion of tree
        
    def visit_Return(self,node):
        ast.NodeVisitor.visit(self,node.value) #passes along to next portion of tree
    
    def visit_Assign(self,node):
        ast.NodeVisitor.visit(self,node.value) #passes along tp next portion of tree
    
    def visit_Str(self,node): #checks for string literals longer than 1
        if len(node.s) > 1:
                self.found=True
                self.errorMessage='String literal longer than 1 found' 
                
                    
def MyGrader(student_code,test_case):
    result=''
    node=ast.parse(student_code) #creates tree out of student_code
    myVisitor=MyVisitor()
    myVisitor.visit(node)        #visits all nodes of tree created from student_code
    if not myVisitor.found:      #code violations check. myVisitor.found will be true if a violation is found
        code = compile(student_code, '', 'exec') 
        try:
            theCode=student_code+"\n"+test_case #combines student_code and test_case into one string
            fullCode=compile(theCode,'','exec') #compiles the combined code
            exec(fullCode)                      #executes combined code
            result=locals()['studentAnswer']    #result is output from the code
        except:
            result='INCORRECT - '+str(sys.exc_info()[1]) #since code didn't execute, result is what went wrong
            return result
    else:
        result='ERROR - '+myVisitor.errorMessage #found coding violation, result is what violation it was
    return result #returns result, no matter what it is

def driver():
    parser = argparse.ArgumentParser() #used to allow grader to accept arguments
    parser.add_argument("student_code", help="The string containing the student's code")
    parser.add_argument("test_case", help="The string containing the test case")
    args = parser.parse_args() #args has the attributes of the above defined arguments
    try:
        student_code=open(args.student_code).read() #assumes student_code is a file, tries to open and then read its content
    except:
        student_code=args.student_code #student_code isn't a file, so it is a string
    student_code=student_code.replace('\\n','\n') #formatting for code
    student_code=student_code.replace('\\t','    ') #formatting for code
    theDef=''
    if student_code[:3]!='def': #builds the def used in calling the student's function. Name of function does not matter
        theArguments=student_code.split('def')
        theDef=theArguments[1]
        theDef=theDef.split()[0]
        theDef=theDef.split('(')[0]
    else:
        theArguments=student_code.split(':')
        theDef=theArguments[0]
        theDef=theDef.split()[1]
        theDef=theDef.split('(')[0]
    global debug #used for debugging
    if debug:
        print(theCode)
    try:
        test_code=open(args.test_case).read() #assumes test_case is a file, tries to open and then read its content
    except:
        test_code=args.test_case #not a file, so it is a string
    #note that the arguments that will be used is a string of the arguments.
    #For example if the argument is a string, 'treasure isLAND', the test_case string would be "'treasure isLAND'"
    #Another example, to give comparison, could be 'treasure isLAND',5. 
    #So the test_case string would be "'treasure isLAND',5".
    #Doing it this way allows the grader to not care about how many arguments there are, and still be able to put the test code together
    test_case = 'studentAnswer='+theDef+'('+test_code+')' #the test case is put together.

    return MyGrader(student_code,test_case) #gets the result from the code given to the grader
    
print(driver()) #used to get the result so the back end can test the answer for correctness
