
student_code = '''
def outputText(inputText):
	return 'Pyand Furniture Auction'
'''

test_case = '''
print( outputText('PyLAND FurnitURE AUCtion') )
'''

code = compile(student_code+test_case, '', 'exec')
print(student_code)
exec(code)
