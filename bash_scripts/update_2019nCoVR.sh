
#!/bin/bash

if [ ! -d "2019nCoVR" ]; then
  mkdir -p 2019nCoVR;
fi

download_db(){
	#Download fastas
	wget https://bigd.big.ac.cn/ncov/genome/sequence/download/fasta -P 2019nCoVR/fastas/
	#Download metadata
	wget https://bigd.big.ac.cn/ncov/genome/export/meta -P 2019nCoVR/fastas/
	#This file is created and put into the fastas folder to keep a track of the creation and modification of the database
	stat 2019nCoVR/fastas &> 2019nCoVR/fastas/stat_out.txt
}

if [ -d "2019nCoVR/fastas" ] 
then
	date_time=$(stat --format %y 2019nCoVR/fastas)
	set -- $date_time
	tar -C 2019nCoVR -zcvf 2019nCoVR/fastas_$1.tar.gz fastas && rm -R 2019nCoVR/fastas
	mkdir 2019nCoVR/fastas
	download_db
else
	mkdir 2019nCoVR/fastas	
	download_db
fi
