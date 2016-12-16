from sys import argv
import os
import fileinput

def findXibs(path):
    if os.path.isdir(path):
        ibFileNames = os.listdir(path) 
        for name in ibFileNames:
            filePath = '%s/%s'%(path, name)

            if os.path.isdir(filePath):
                findXibs(filePath)
            elif name.endswith('.xib'):
                fileReader = open(filePath, 'r')
                fileHanlder.seek(0)
                correctText = replace(fileHanlder.read())
                fileHanlder.seek(0)
                # fileHanlder.write(correctText)
                fileHanlder.close()

def replace(text):
    place = '<capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>'

    if place in text:
        result1 = text.replace('<capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>', '')
        result2 = result1.replace('<deployment identifier="iOS"/>', '<deployment identifier="iOS"/>\n<development version="7000" identifier="xcode"/>')
        print '+++++++++\n%s--------' %(result2)
        return result2

if __name__ == "__main__":
    findXibs(argv[1])