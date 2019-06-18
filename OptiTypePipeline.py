#!/usr/bin/python
# -*- coding: UTF-8 -*-
###########netMHC result parsing and filter based on binding affinity and FPKM #########
import sys,getopt,os
import time,os


opts,args=getopt.getopt(sys.argv[1:],"hi:o:s:",["input_neo_file","out_dir","sample_id"])
input_neo_file =""
out_dir=""
sample_id=""
USAGE='''usage: python netCTLPAN.py -i <input_neo_file> -o <outdir> -s <sample_id>
    required argument:
      -i | --input_neo_file : input file,result from netMHC parse
      -o | --out_dir : output directory
      -s | --sample_id : sample id
'''
for opt,value in opts:
  if opt =="h":
    print USAGE
    sys.exit(2)
  elif opt in ("-i","--input_neo_file"):
    input_neo_file=value
  elif opt in ("-o","--out_dir"):
    out_dir =value  
  elif opt in ("-s","sample_id"):
    sample_id=value
#print coverage
if (input_neo_file =="" or out_dir =="" or sample_id==""):
  print USAGE
  sys.exit(2)
