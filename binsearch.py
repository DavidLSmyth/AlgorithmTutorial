def binSearch(array,lookupValue,position,iterations):
	iterations=iterations+1
	if len(array)==0:
		return "Value not found"
	else:
		midpoint=len(array)/2
		print(array,midpoint)
		print(position)
		print('iterations',iterations)
		if array[midpoint]==lookupValue:
			return "Found at position: "+str(int(arraySize*(position))+1)
		elif lookupValue>array[midpoint]:
			return binSearch(array[midpoint:],lookupValue,position+(0.5**iterations),iterations)
		else:
			return binSearch(array[:midpoint],lookupValue,position-(0.5**iterations),iterations)
def binSearchInit(array,lookupValue):
	global arraySize
	arraySize=len(array)
	return binSearch(array,lookupValue,0.5,1)

print(binSearchInit([1,2,3,4,5,6,7,8,9,10,20,80,300],300))
