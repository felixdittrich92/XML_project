import xmlschema
from lxml import etree

# validate XSD and XML
my_schema = xmlschema.XMLSchema('russiandoll_FelixDittrich.xsd')
my_schema1 = xmlschema.XMLSchema('venetianblind_FelixDittrich.xsd')
answer = my_schema.is_valid('Aufgabe3.xml')
answer1 = my_schema1.is_valid('Aufgabe3.xml')
if answer is True:
    print('Russian Doll: .xsd and .xml are valid !!')
else:
    print('Russian Doll: False')

if answer1 is True:
    print('Venetian Blind: .xsd and .xml are valid !!')
else:
    print('Venetian Blind: False')