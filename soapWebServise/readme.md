# Create a web service class

# Generate a WSDL file for the above Web Service class and save the generated XML

# Generate partner WSDL FileUnder Build section, navigate setup -> API and click Generate Partner WSDL link. (All org WSDL)

# Log into another Salesforce. Apex Classes, click Generate from WSDL button. Repeat the above step for web service class. (if you get any error during the apex generation, please replace all the occurrences of “anyType” to “string” in the file).

# Create Remote site settings (https://login.salesforce.com and like this https://ap1.salesforce.com)

# Create apex class to call in to first org
