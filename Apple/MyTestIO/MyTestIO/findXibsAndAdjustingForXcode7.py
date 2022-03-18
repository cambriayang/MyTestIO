from sys import argv
import os
import fileinput
from os import rename
import os.path

def findXibs(path):
    if os.path.isdir(path):
        ibFileNames = os.listdir(path) 
        for name in ibFileNames:
            if path.endswith('/'):
                filePath = '%s%s'%(path, name)
                copyFile = '%s%s'%(path, 'copied.xib')
            else:
                filePath = '%s/%s'%(path, name)
                copyFile = '%s/%s'%(path, 'copied.xib')

            if os.path.isdir(filePath):
                findXibs(filePath)
            elif name.endswith('.xib'):
            	fileReader = open(filePath, 'r')
            	fileWriter = open(copyFile, 'a')

                if isXcode8Xibs(filePath, str(fileReader.read())):
                	for line in open(filePath,'r').readlines():
                		if '<deployment identifier="iOS"/>' in line:
                			fileWriter.write('%s\t\t<development version="7000" identifier="xcode"/>\n' %line)
                		elif '<capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>' in line:
                			continue
                		else:
                			fileWriter.write(line)
                 	
                 	os.remove(filePath)
                	rename(copyFile, filePath)

                fileWriter.close()
                fileReader.close()    

                if os.path.isfile(copyFile):
	                	os.remove(copyFile)       

def replace(path, file):
    flag = '<capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>'

    if flag in file:
        result1 = file.replace('%s' %flag, '')
        result2 = result1.replace('<deployment identifier="iOS"/>', '<deployment identifier="iOS"/>\n<development version="7000" identifier="xcode"/>')
        print '==========[%s]=========\n' %(path)
        print '+++++++++\n%s--------' %(result2)
        return result2

def isXcode8Xibs(path, file):
    flag = '<capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>'

    if flag in file:
        return True
    else:
        return False

if __name__ == "__main__":
    findXibs(argv[1])