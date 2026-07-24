# IGSN Core Dokumentation

# [`<identifier>`](#identifier)
- **Element Type**: element
- **Obligation**: mandatory
- **Data type**: xs:string
- **Content**: free text
- **Occurence**: 1..1
- **Attributes provided** [@identifierType](#identifierType)
-  **Definition**: The Identifier is a unique string that identifies a resource. IGSN (International GeoSample Number) registered by an IGSN member.
- **Purpose and meaning**: This element is used to store the identifier of the resource, thereby ensuring that the resource can be uniquely identified
- **Example**: <br> 
``` xml 
<igsn:identifier identifierType="DOI">GFBNO7002EXH4001</igsn:identifier>

```
- **Mapping**: <br>

|source | element name|
|--|--|
|DataCite | [`<identifier>`](https://datacite-metadata-schema.readthedocs.io/en/4.7/properties/identifier/#)|
|IGSN Descriptive V1.3 |`<identifier>` (ID 1)|
|IGSN Supplementary V1.3 | `<igsn>` (ID 4) |
| IGSN Registration V1.3 | `<sampleNumber>`  (ID 1)|

### [`@identifierType`]()
- **Element Type**: attribute
- **Obligation**: mandatory
- **Data type**: daci:relatedIdentifierType
- **Content**: enumeration list
- **Occurence**: 1..1
- **Elements using this attribute** [`<identifier>`](#identifier)
- **Definition**: The type of Identifier.
- **Purpose and meaning**: Mandatory for registration with DataCite.This attribute ensures that the type of the identifier can be specified correctly. This is necessary to ensure error-free machine processing


# [`<name>`](#name)
- **Element Type**: element
- **Obligation**: mandatory
- **Data type**: xs:string
- **Content**: free text
- **Occurence**: 1..n
- **Attributes provided** [@titleType](#titleType); [@lang](#lang)
-  **Definition**: This element contains the common, humanreadable name of the resource described.
- **Purpose and meaning**: This element is used to name and identify a resource in a technical and linguistic context. It refers to the resource by its common name and is designed to be readable by humans. The name element should be used when the common name of the resource must be specified. The primary name of the resource should be entered. Variant spellings, abbreviated forms or alternative names should only be used if they correspond to the officially used or technically authoritative name. The element does not need to be unique and may occur multiple times.
- **Example**: <br> 
``` xml 

<igsn:name titleType="AlternativeTitle" lang="en">WR_12-15</igsn:name>

```
### [`@titleType`](#titleType)
- **Element Type**: attribute
- **Obligation**: optional
- **Data type**: daci:titleType
- **Content**: enumeration list
- **Occurence**: 0..1
- **Elements using this attribute** [`<name>`](#name)
- **Definition**: This attribute is used to specify the type of entry contained within the [`<name>`](#name) element.
- **Purpose and meaning**: It is used to distinguish the title of the registered sample from the sample’s common names.

### [`@lang`](#lang)
- **Element Type**: attribute
- **Obligation**: optional
- **Data type**: xs:language
- **Content**: enumeration list
- **Occurence**: 0..1
- **Elements using this attribute** [`<name>`](#name); [`<archiveName>`](#archiveName); [`<creatorName>`](#creatorName); [`<contributerName>`](#contributerName); [`<publisher>`](#publisher); [`<geoLocationPlace>`](#geoLocationPlace); [`<classification>`](#classification); [`<material>`](#material); [`<alternateMaterial>`](#alternateMaterial)
- **Definition**: distinguishes the language
- **Purpose and meaning**: Ensures that machines can unambiguously identify the language. This is listed as a required element only for the “Description” field, as a large amount of free text is entered there and it is therefore essential to specify the language used