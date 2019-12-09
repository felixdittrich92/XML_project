import xmlschema
from lxml import etree

# validate XSD and part from XML
my_schema = xmlschema.XMLSchema('xml/schema.xsd')
answer = my_schema.is_valid('xml/weather_test.xml')
print(answer)

# validate DTD and part from XML
parser = etree.XMLParser(dtd_validation=True)
tree = etree.parse("xml/weather_test.xml", parser)
print('without message .dtd and .xml are valid !!')