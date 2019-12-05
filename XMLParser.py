#TODO

import csv
import lxml.etree as ET

headers = ['WBANNO', 'UTC_DATE', 'UTC_TIME', 'LST_DATE', 'LST_TIME', 'CRX_VN', 'LONGITUDE', 'LATITUDE', 'T_CALC', 'T_HR_AVG', 'T_MAX', 'T_MIN', 'P_CALC', 'SOLARAD', 'SOLARAD_FLAG SOLARAD_MAX', 'SOLARAD_MAX_FLAG', 'SOLARAD_MIN', 'SOLARAD_MIN_FLAG', 'SUR_TEMP_TYPE SUR_TEMP', 'SUR_TEMP_FLAG SUR_TEMP_MAX', 'SUR_TEMP_MAX_FLAG', 'SUR_TEMP_MIN', 'SUR_TEMP_MIN_FLAG', 'RH_HR_AVG'; 'RH_HR_AVG_FLAG', 'SOIL_MOISTURE_5', 'SOIL_MOISTURE_10', 'SOIL_TEMP_5', 'SOIL_TEMP_10', 'SOIL_TEMP_50', 'SOIL_TEMP_100']

# INITIALIZING XML FILE
root = ET.Element('root')

# READING CSV FILE AND BUILD TREE
with open('data/one_day.csv') as f:
    next(f)                             # SKIP HEADER
    csvreader = csv.reader(f)

    for row in csvreader:        
        data = ET.SubElement(root, "data")
        for col in range(len(headers)):
            node = ET.SubElement(data, headers[col]).text = str(row[col])

# SAVE XML TO FILE
tree_out = (ET.tostring(root, pretty_print=True, xml_declaration=True, encoding="UTF-8"))

# OUTPUTTING XML CONTENT TO FILE
with open('Output.xml', 'wb') as f:
    f.write(tree_out)