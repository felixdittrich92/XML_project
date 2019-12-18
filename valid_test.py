import xmlschema
from lxml import etree

"""
# validate XSD and part from XML
my_schema = xmlschema.XMLSchema('xml/schema.xsd')
answer = my_schema.is_valid('xml/weather_test.xml')
if answer is True:
    print('.xsd and .xml are valid !!')
else:
    print('False')

# validate DTD and part from XML
parser = etree.XMLParser(dtd_validation=True)
tree = etree.parse("xml/weather_test.xml", parser)
print('.dtd and .xml are valid !!')
"""

# validate XSD and part from XML
my_schema = xmlschema.XMLSchema('xml/schema.xsd')
answer = my_schema.is_valid('xml/one_day.xml')
if answer is True:
    print('.xsd and .xml are valid !!')
else:
    print('False')

# validate DTD and part from XML
parser = etree.XMLParser(dtd_validation=True)
tree = etree.parse("Abgabe/weather_dtd.xml", parser)
print('.dtd and .xml are valid !!')
