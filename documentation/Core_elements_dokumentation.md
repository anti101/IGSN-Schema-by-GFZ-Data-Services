# IGSN Core Dokumentation

## `<identifier>`
- **Element Type**: element
- **Obligation**: mandatory
- **Data type**: xs:string
- **Content**: free text
- **Occurence**: 1..1
- **Definition**: The Identifier is a unique string that identifies a resource. IGSN (International GeoSample Number) registered by an IGSN member.
- **Purpose and meaning**: This element is used to store the identifier of the resource, thereby ensuring that the resource can be uniquely identified
- **Example**: <br> 
``` xml 

  <daci:identifier identifierType="DOI"> GFBNO7002EXH4001 </daci:identifier>

```



## `@identifierType`
- **Element Type**: attribute
- **Definition**: The type of Identifier.
- **Purpose and meaning**: Mandatory for registration with DataCite.This attribute ensures that the type of the identifier can be specified correctly. This is necessary to ensure error-free machine processing
- **Obligation**: mandatory
- **Data type**: daci:relatedIdentifierType
- **Content**: enumeration list

