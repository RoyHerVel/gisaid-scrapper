#!/bin/bash

#Script to update the database from gisaid on a regular basis
#This script downloads the db every time and it will be modified for snakemake
#This script is intended to be used in combiation whith a job scheduling using cron
#Modify paths to corresponding directories (if needed)
pathout=./
pathscrap=./gisaid-scrapper-master/

conda activate gisaid_scrapper

if [ -d "fastas" ] 
then
	date_time=$(stat --format %y ${pathout}fastas)
	set -- $date_time
	tar -zcvf ${pathout}fastas_$1.tar.gz ${pathout}fastas && rm -R ${pathout}fastas
	#Note that a file with valid credentials is needed
	python ${pathsscrap}scrap.py --filename ${pathout}credentials.txt --destination ${pathout}fastas --whole
	#This file is created and put into the fastas folder to keep a track of the creation and modification of the database
	stat ${pathout}fastas &> ${pathout}fastas/stat_out.txt
else
	python ${pathsscrap}scrap.py --filename ${pathout}credentials.txt --destination ${pathout}fastas --whole
	stat ${pathout}fastas &> ${pathout}fastas/stat_out.txt

fi

conda deactivate

echo "DONE!"
