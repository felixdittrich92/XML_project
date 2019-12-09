import pandas as pd

# clean data and change separator
data = pd.read_csv('data/weather.csv', sep='\s+')
data = data.drop(['WBANNO', 'CRX_VN', 'LONGITUDE', 'LATITUDE', 'P_CALC', 'SOLARAD_FLAG', 'SOLARAD_MAX_FLAG', 'SOLARAD_MIN_FLAG', 'SUR_TEMP_TYPE', 'SUR_TEMP_FLAG', 'SUR_TEMP_MAX_FLAG', 'SUR_TEMP_MIN_FLAG', 'RH_HR_AVG_FLAG', 'SOIL_MOISTURE_20', 'SOIL_MOISTURE_50', 'SOIL_MOISTURE_100', 'SOIL_TEMP_20'], axis = 1)
print(data.head())
data.to_csv('data/weather_modified.csv', sep=',', index=False, header=None)