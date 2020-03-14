# GISAID scrapper
Scrapping tool for GISAID data regarding SARS-CoV-2. You need an active account in order to use it. 

## Preparations
Install all requirements for the scrapper.
```
pip install -r requirements.txt
```
You need to download a ![Firefox WebDriver](https://github.com/mozilla/geckodriver/releases) for your operating system and place it in script's directory.

Your login and password can be provided in `credentials.txt` file in format:
```
login
password
```

## Usage
```
usage: gisaid_scrapper.py [-h] [--username USERNAME] [--password PASSWORD]  
                          [--filename FILENAME] [--destination DESTINATION] 
                          [--headless [HEADLESS]] [--whole [WHOLE]]

optional arguments:
  -h, --help            show this help message and exit
  --username USERNAME, -u USERNAME
                        Username for GISAID
  --password PASSWORD, -p PASSWORD
                        Password for GISAID
  --filename FILENAME, -f FILENAME
                        Path to file with credentials (alternative, default:
                        credentials.txt)
  --destination DESTINATION, -d DESTINATION
                        Destination directory (default: fastas/)
  --headless [HEADLESS], -q [HEADLESS]
                        Headless mode of scraping (experimental)
  --whole [WHOLE], -w [WHOLE]
                        Scrap whole genomes only
```
Example:
```
python3 gisaid_scrapper.py -u user -p pass -w
```
should run the scrapper with username `user` and password `pass`, downloading only whole sequence data.

## Result
The whole and partial genom sequences from GISAID will be downloaded into `fastas/` directory. `metadata.tsv` file will also be created, containing following information for every sample:

* Accession
* Collection date	
* Location	
* Host	
* Additional location information	
* Gender	
* Patient age	
* Patient status	
* Specimen source	
* Additional host information	
* Outbreak	
* Last vaccinated	
* Treatment	
* Sequencing technology	
* Assembly method	
* Coverage	
* Comment	
* Length

as long as they were provided.
You can interrupt the download and resume it later, the samples won't be downloaded twice. 


The tool was written for personal use, so little to no maintenance is to be expected.
