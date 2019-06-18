#!/usr/bin/python
# -*- coding: UTF-8 -*-
###########process varscan result into pyclone input#########
import sys,getopt

opts,args=getopt.getopt(sys.argv[1:],"h:i:",["vep_input_file"])
vep_input_file=""
USAGE='''usage: python pyclone_input.py -i <vep_input_file> [option]"
		required argument:
			-i | --vep_input_file : snv vep input file
'''
for opt,value in opts:
	if opt =="h":
		print USAGE
		sys.exit(2)
	elif opt in ("-i","--vep_input_file"):
		vep_input_file=value


print vep_input_file

