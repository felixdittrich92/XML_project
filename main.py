import pandas as pd

data = pd.read_csv('data/weather.csv', sep='\s+')
data = data.drop(['SOIL_TEMP_20', 'SOIL_MOISTURE_100', 'SOIL_MOISTURE_50', 'SOIL_MOISTURE_20'], axis = 1)
data = data.drop(data.index[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]], axis=0)
#print(data.head(24))
for i in range(47, 100):
    data = data.drop(data.index[[i]], axis=0)

print(data.head(50))

export_csv = data.to_csv ('out.csv', index = None)