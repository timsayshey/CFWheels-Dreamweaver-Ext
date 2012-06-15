<cfoutput>
	
	<!--- Converts CFWheels API XML File to XML that is compatible with dreamweaver --->
	
	<cfhttp url="http://cfwheels.org/docs/1-1/function.xml" method="get">
		<cfhttpparam type="header" name="accept-encoding" value="deflate;q=0">
		<cfhttpparam type="header" name="te" value="deflate;q=0">
	</cfhttp>
	
	<cfset objRSS = xmlParse(Trim(cfhttp.filecontent))> 
	<cfset Item_Length = arraylen(objRSS.functions.function)>
	
	<cfloop from="1" to="#Item_Length#" index="i">	
		
		<cfif StructKeyExists(objRSS.functions.function[i],"arguments") AND StructKeyExists(objRSS.functions.function[i].arguments,"argument")>
			
			<function pattern="#objRSS.functions.function[i].XmlAttributes.name#(<cfparam name="#objRSS.functions.function[i].arguments.argument[1].XmlAttributes.name#" default="">
				
			<cfif StructKeyExists(objRSS.functions.function[i],"arguments") AND 
				  StructKeyExists(objRSS.functions.function[i].arguments,"argument") AND
				  StructKeyExists(objRSS.functions.function[i].arguments.argument[1],"XmlAttributes") AND 
				  StructKeyExists(objRSS.functions.function[i].arguments.argument[1].XmlAttributes,"name")>
				
				<cfset Item_Length2 = arraylen(objRSS.functions.function[i].arguments.argument)>
				
				<cfloop from="1" to="#Item_Length2#" index="j">
					<cfif StructKeyExists(objRSS.functions.function[i],"arguments") AND 
						  StructKeyExists(objRSS.functions.function[i].arguments,"argument") AND
				  		  StructKeyExists(objRSS.functions.function[i].arguments.argument[j],"XmlAttributes") AND 
				  		  StructKeyExists(objRSS.functions.function[i].arguments.argument[j].XmlAttributes,"name")>
						
						  #objRSS.functions.function[i].arguments.argument[j].type.xmltext#:
						  #objRSS.functions.function[i].arguments.argument[j].XmlAttributes.name#<cfif j neq Item_Length2>,</cfif>
					
					</cfif>
				
				</cfloop>
			
			</cfif>

			)" doctypes="ColdFusion,CFC" />		
			
		</cfif>
	</cfloop>

</cfoutput>