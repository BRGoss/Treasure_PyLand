import graderPaul
import unittest

class TestGraderMethods(unittest.TestCase):
    def test_correct(self):
        student_code = '''
def replace_with_ascii(inputString):
	theNumbers=inputString.split()
	for index in range(len(theNumbers)):
		theNumbers[index]=chr((int)(theNumbers[index]))
	answer=''.join(theNumbers)
	return answer
'''

        test_case = '''
global studentAnswer
global correctAnswer
studentAnswer=replace_with_ascii('97 98 99 100 101')
correctAnswer='abcde'
'''
        self.assertEqual(graderPaul.MyGrader(student_code,test_case),'Correct')
    def test_import(self):
        student_code = '''
def replace_with_ascii(inputString):
	import string
	theNumbers=inputString.split()
	for index in range(len(theNumbers)):
		theNumbers[index]=chr((int)(theNumbers[index]))
	answer=''.join(theNumbers)
	return answer
'''

        test_case = '''
global studentAnswer
global correctAnswer
studentAnswer=replace_with_ascii('97 98 99 100 101')
correctAnswer='abcde'
'''
        self.assertEqual(graderPaul.MyGrader(student_code,test_case),'Incorrect')
    def test_call(self):
        student_code = '''
def replace_with_ascii(inputString):
	fo=open('graderPaul.py')
	theNumbers=inputString.split()
	for index in range(len(theNumbers)):
		theNumbers[index]=chr((int)(theNumbers[index]))
	answer=''.join(theNumbers)
	return answer
'''

        test_case = '''
global studentAnswer
global correctAnswer
studentAnswer=replace_with_ascii('97 98 99 100 101')
correctAnswer='abcde'
'''
        self.assertEqual(graderPaul.MyGrader(student_code,test_case),'Incorrect')

    def test_incorrect(self):
        student_code = '''
def replace_with_ascii(inputString):
	theNumbers=string.split(inputString,' ')
	for index in range(len(theNumbers)):
		theNumbers[index]=chr((int)(theNumbers[index]))
	answer=''.join(theNumbers)
	return answer
'''

        test_case = '''
global studentAnswer
global correctAnswer
studentAnswer=replace_with_ascii('97 98 99 100 101')
correctAnswer='abcde'
'''
        self.assertEqual(graderPaul.MyGrader(student_code,test_case),'Incorrect')
if __name__=='__main__':
    unittest.main()
