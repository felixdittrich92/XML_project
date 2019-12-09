import pandas as pd
import csv



data = csv.reader(open('data/weather_modified.csv'), delimiter=',')

print('start: parse CSV to XML')

f = open('xml/weather.xml', 'w')
f.write('<?xml version="1.0" encoding="UTF-8"?>\n')
# root element
f.write('<weather_data>\n')

for row in data:
    # XML child elements
    f.write('   ' + '<observation>\n') #Logger   add number
    f.write('       ' + '<date>\n') # Datum/Uhrzeit
    f.write('           ' + '<UTC_DATE>' + row[0] + '</UTC_DATE>\n')
    f.write('           ' + '<UTC_TIME>' + row[1] + '</UTC_TIME>\n')
    f.write('           ' + '<LST_DATE>' + row[2] + '</LST_DATE>\n')
    f.write('           ' + '<LST_TIME>' + row[3] + '</LST_TIME>\n')
    f.write('       ' + '</date>\n')
    #f.write('       ' + '<position>\n') # Position  every time same
    #f.write('           ' + '<LONGITUDE>' + row[4] + '</LONGITUDE>\n')
    #f.write('           ' + '<LATITUDE>' + row[5] + '</LATITUDE>\n')
    #f.write('       ' + '</position>\n')
    f.write('       ' + '<temperature>\n') # Temperatur
    f.write('           ' + '<T_CALC>' + row[4] + '</T_CALC>\n')
    f.write('           ' + '<T_HR_AVG>' + row[5] + '</T_HR_AVG>\n')
    f.write('           ' + '<T_MAX>' + row[6] + '</T_MAX>\n')
    f.write('           ' + '<T_MIN>' + row[7] + '</T_MIN>\n')
    f.write('           ' + '<infrared_surface_temperature>\n') # Infrarotoberflächentemperatur
    f.write('               ' + '<SUR_TEMP>' + row[11] + '</SUR_TEMP>\n')
    f.write('               ' + '<SUR_TEMP_MAX>' + row[12] + '</SUR_TEMP_MAX>\n')
    f.write('               ' + '<SUR_TEMP_MIN>' + row[13] + '</SUR_TEMP_MIN>\n')
    f.write('           ' + '</infrared_surface_temperature>\n')
    f.write('           ' + '<soil_temperature>\n') # Bodentemperatur
    f.write('               ' + '<SOIL_TEMP_5>' + row[17] + '</SOIL_TEMP_5>\n')
    f.write('               ' + '<SOIL_TEMP_10>' + row[18] + '</SOIL_TEMP_10>\n')
    f.write('               ' + '<SOIL_TEMP_50>' + row[19] + '</SOIL_TEMP_50>\n')
    f.write('               ' + '<SOIL_TEMP_100>' + row[20] + '</SOIL_TEMP_100>\n')
    f.write('           ' + '</soil_temperature>\n')
    f.write('       ' + '</temperature>\n')
    f.write('       ' + '<solar_radiation>\n')  #Sonneneinstrahlung
    f.write('           ' + '<SOLARAD>' + row[8] + '</SOLARAD>\n')
    f.write('           ' + '<SOLARAD_MAX>' + row[9] + '</SOLARAD_MAX>\n')
    f.write('           ' + '<SOLARAD_MIN>' + row[10] + '</SOLARAD_MIN>\n')
    f.write('       ' + '</solar_radiation>\n')
    f.write('       ' + '<humidity>\n') #Feuchtigkeit
    f.write('           ' + '<air_humidity>\n') # Luftfeuchtigkeit
    f.write('               ' + '<RH_HR_AVG>' + row[14] + '</RH_HR_AVG>\n')
    f.write('           ' + '</air_humidity>\n') 
    f.write('           ' + '<earth_humidity>\n') # Bodenfeuchtigkeit
    f.write('               ' + '<SOIL_MOISTURE_5>' + row[15] + '</SOIL_MOISTURE_5>\n')
    f.write('               ' + '<SOIL_MOISTURE_10>' + row[16] + '</SOIL_MOISTURE_10>\n')
    f.write('           ' + '</earth_humidity>\n')
    f.write('       ' + '</humidity>\n')
    f.write('   ' + '</observation>\n')
# close root
f.write('</weather_data>')
f.close()

print('finished: parse CSV to XML')