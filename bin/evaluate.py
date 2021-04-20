import pandas as pd
import sys

input_csv = sys.argv[1]
df = pd.read_csv(input_csv, sep=',', comment='#')

print(df)