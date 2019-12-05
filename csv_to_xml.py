import pandas as pd
from dicttoxml import dicttoxml

data = pd.read_csv('data/one_day.csv', sep='\s+')
df = pd.DataFrame(data, columns=data.keys())

data_dict = df.to_dict(orient="records")
xml_data = dicttoxml(data_dict).decode()
with open("output.xml", "w+") as f:
    f.write(xml_data)
