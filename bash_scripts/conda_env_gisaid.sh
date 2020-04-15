#Conda environment for GISAID scrapper
conda create –-name gisaid_scrapper python=3.7
conda activate gisaid_scrapper

conda install -c anaconda beautifulsoup4
conda install -c conda-forge selenium=3.141.0
conda install -c anaconda requests=2.22.0
conda install -c conda-forge tqdm=4.41.1

conda deactivate
#You need to download a Firefox WebDriver for your operating system and place it in script's directory.
