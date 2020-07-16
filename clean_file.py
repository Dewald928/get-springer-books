import pandas as pd
import numpy as np

print('hello')

df = pd.read_csv('all_links.csv')
df.columns = ['links']
df_only = df[df['links'].str.contains('link.springer')]
df_only.to_csv('urls.csv')
