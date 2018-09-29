#!/usr/bin/python

# Set default logging handler to avoid "No handler found" warnings.
import glob

import string 

# Here add the path to the default template you want to use...
templateString = open('templates/template-XiaomiMijiaMi.pto', 'r').read()

# Path of the unstitched images - Copy your JPG files in the "files" folder
folderName="unstitched"
files = glob.glob(folderName + "/*.JPG")

for entry in files:
	filenameImage=entry.replace(folderName + '/', '')
	filenamePTOOutput=entry.replace('.JPG', '.pto')

	stringToWrite=templateString
	stringToWrite = string.replace(stringToWrite,'image.jpg',filenameImage)
	
	text_file = open(filenamePTOOutput, "w")
	text_file.write(stringToWrite)
	text_file.close()




	
	
