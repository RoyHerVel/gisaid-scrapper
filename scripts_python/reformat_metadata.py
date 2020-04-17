import pandas as pd

file = pd.read_excel(snakemake.input[0])

file.to_csv(snakemake.output.metadata,
             sep="\t",
             index=False)