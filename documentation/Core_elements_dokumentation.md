# IGSN Core Dokumentation

# 1. [`<identifier>`](#identifier) *mandatory Element*
``` xml 
<igsn:identifier identifierType="DOI">GFBNO7002EXH4001</igsn:identifier>

```
- **Obligation**: mandatory
- **Data type**: xs:string
- **Content**: free text
- **Occurence**: 1..1
-  **Definition**: The Identifier is a unique string that identifies a resource. IGSN (International GeoSample Number) registered by an IGSN member.
- **Purpose and meaning**: This element is used to store the identifier of the resource, thereby ensuring that the resource can be uniquely identified
- **Mapping**:

|source scheme | element name|
|--|--|
|DataCite | [`<identifier>`](https://datacite-metadata-schema.readthedocs.io/en/4.7/properties/identifier/#)|
|IGSN Descriptive V1.3 |`<identifier>` (ID 1)|
|IGSN Supplementary V1.3 | `<igsn>` (ID 4) |
| IGSN Registration V1.3 | `<sampleNumber>`  (ID 1)|

## 1.1 [`@identifierType`](@identifierType) *mandatory Attribute*
- **Data type**: daci:relatedIdentifierType
- **Content**: enumeration list
- **Occurence**: 1..1
- **Definition**: The type of Identifier.
- **Purpose and meaning**: Mandatory for registration with DataCite.This attribute ensures that the type of the identifier can be specified correctly. This is necessary to ensure error-free machine processing
- **Mapping**:

|source scheme | element name|
|--|--|
|DataCite | [`@identifierType`](https://datacite-metadata-schema.readthedocs.io/en/4.7/properties/identifier/#a-identifiertype) or [`@relatedIdentifierType`](https://datacite-metadata-schema.readthedocs.io/en/4.7/properties/relatedidentifier/#a-relatedidentifiertype)|
|IGSN Descriptive V1.3 |@type(ID 1.1), @type(ID 4.1), @type(ID 6.1.1)|
|IGSN Supplementary V1.3 | @relatedIdentifierType(ID 78.2)|
| IGSN Registration V1.3 | `<identifierType>`(ID 1.1), @relatedIdentifierType(ID 3.1)|


---
---



# 2. [`<name>`](#name) *mandatory Element*
``` xml 
<igsn:name titleType="AlternativeTitle" lang="en">WR_12-15</igsn:name>
```
- **Data type**: xs:string
- **Content**: free text
- **Occurence**: 1..n
- **Definition**: This element contains the common, humanreadable name of the resource described.
- **Purpose and meaning**: This element is used to name and identify a resource in a technical and linguistic context. It refers to the resource by its common name and is designed to be readable by humans. The name element should be used when the common name of the resource must be specified. The primary name of the resource should be entered. Variant spellings, abbreviated forms or alternative names should only be used if they correspond to the officially used or technically authoritative name. The element does not need to be unique and may occur multiple times.
- **Mapping**: <br>
|source scheme | element name|
|--|--|
|DataCite |[`<title>`](https://datacite-metadata-schema.readthedocs.io/en/4.7/properties/title/#title)|
|IGSN Descriptive V1.3 |`<name>`(ID 2)|
|IGSN Supplementary V1.3 | `<user_code>`(ID 1), `<name>`(ID 3), `<sample_other_names>`(ID 77), `<sample_other_name>`(ID 77.1)|
| IGSN Registration V1.3 | No corresponding item |

- **aditional information**: In order to clearly distinguish between `<title>`, `<name>` and `<alternateIdentifier>` within the schema, the decision was made not to align the element identifier `<name>` with DataCite's `<title>`, even though the `<name>` element is mapped to `<daci:title>` for registration purposes. The term ‘title’ summarises the content, attracts attention and serves as a structural guide for the reader. Here, however, `<name>` is used to capture all human-readable designations for the sample and to generate the title that corresponds to the registered resource.

## 2.1 [`@titleType`](#titleType)  *optional Attribute*
- **Data type**: daci:titleType
- **Content**: enumeration list
- **Occurence**: 0..1
- **Definition**: This attribute is used to specify the type of entry contained within the [`<name>`](#name) element.
- **Purpose and meaning**: It is used to distinguish the title of the registered sample from the sample’s common names.
- **Mapping**: <br>
|source scheme | element name|
|--|--|
|DataCite | [`@titleType`](https://datacite-metadata-schema.readthedocs.io/en/4.7/properties/title/#title) |
|IGSN Descriptive V1.3 |No corresponding item|
|IGSN Supplementary V1.3 | No corresponding item|
| IGSN Registration V1.3 | No corresponding item|


## 2.2 [`@lang`](#lang) *optional Attribute*
- **Data type**: xs:language
- **Content**: enumeration list
- **Occurence**: 0..1
- **Definition**: distinguishes the language
- **Purpose and meaning**: Ensures that machines can unambiguously identify the language. This is listed as a required element only for the “Description” field, as a large amount of free text is entered there and it is therefore essential to specify the language used

---
---


# 3 [`<agents>`](#agents)
``` xml 
<igsn:agents>
		<igsn:creator creatorType="creator">
			<igsn:creatorName nameType="Personal" lang="en">Antipanova, Tatjana </igsn:creatorName>
			<igsn:givenName>Tatjana</igsn:givenName>
			<igsn:familyName>Antipanova</igsn:familyName>
			<igsn:nameIdentifier nameIdentifierScheme="ORCID" schemeURI="https://orcid.org">0000-0001-5140-8602</igsn:nameIdentifier>
			<igsn:affiliation affiliationIdentifier="https://ror.org/04z8jg394" affiliationIdentifierScheme="ROR" schemeURI="https://ror.org">GFZ Helmholtz Centre for Geosciences</igsn:affiliation>
		</igsn:creator>
		<igsn:creator creatorType="collector">
			<igsn:creatorName nameType="Organizational" lang="en">GFZ Dataservices</igsn:creatorName>
			<igsn:nameIdentifier nameIdentifierScheme="ROR" schemeURI="https://ror.org">https://ror.org/04z8jg394</igsn:nameIdentifier>
		</igsn:creator>
		<igsn:contributor contributorType="ContactPerson">
			<igsn:contributorName nameType="Personal" lang="en">Antipanova, Tatjana</igsn:contributorName>
			<igsn:givenName>Tatjana</igsn:givenName>
			<igsn:familyName>Antipanova</igsn:familyName>
            <igsn:nameIdentifier nameIdentifierScheme="ORCID" schemeURI="https://orcid.org">0000-0001-5140-8602</igsn:nameIdentifier>
			<igsn:affiliation affiliationIdentifier="https://ror.org/04z8jg394" affiliationIdentifierScheme="ROR" schemeURI="https://ror.org">GFZ Helmholtz Centre for Geosciences</igsn:affiliation>
		</igsn:contributor>
		<igsn:contributor contributorType="RegistrationAuthority">
			<igsn:contributorName nameType="Organizational" lang="en">GFZ Dataservices</igsn:contributorName>
            <igsn:nameIdentifier nameIdentifierScheme="ROR" schemeURI="https://ror.org">https://ror.org/04z8jg394</igsn:nameIdentifier>
		</igsn:contributor>
		<publisher publisherIdentifier="https://doi.org/10.17616/R3VQ0S" publisherIdentifierScheme="re3data" schemeURI="https://re3data.org/" xml:lang="en">GFZ Data Services</publisher>
	</igsn:agents>
```
- **Element Type**: wrapper
- **Obligation**: mandatory
- **Data type**: xs:complexType
- **Content**: No entries expected
- **Occurence**: 1..1
-  **Definition**: A wrapper element that bundles all elements relating to specific persons and organizations
- **Purpose and meaning**: This wrapper is designed to group together all the agents (people and organizations) involved in the resource and make them available in a single location within the schema
- **Example**: <br> 

- **aditional information**: As part of the harmonisation process, the elements relating to the people involved in the publication were grouped together to improve readability. This has made the schema easier to reuse and understand.

## 3.1 [`<creator>`](#creator)
- **Element Type**: wrapper
- **Obligation**: mandatory
- **Data type**: xs:complexType
- **Occurence**: 1..n
- **Definition**: "The creator wrapper contains a list of “the main researcher(s) involved...in priority order.” For IGSN IDs, this could be the sample collector/creator, chief scientist, curator, or even the person who deposited the sample into a repository.
As a norm, IGSN ID registrants are expected to collect information about the sample owner, Principle Investigator, and/or otherwise. However, if no appropriate name is available, the property will be populated with the name of the IGSN ID Repository registrant"
- **Purpose and meaning**: This element is required for registering the sample with DataCite; it contains all the information needed to uniquely identify the collector and/or creator of the resource
- **Mapping**: <br>
|source scheme | element name|
|--|--|
|DataCite | [`<creator>`](https://datacite-metadata-schema.readthedocs.io/en/4.7/properties/creator/)|
|IGSN Descriptive V1.3 |`<collector>` (ID 9)|
|IGSN Supplementary V1.3 | `<sampled_by>` (ID 8), `<collector>` (ID 59) |
| IGSN Registration V1.3 |No corresponding item |


### 3.1.1 [`@creatorType`](#creatorType)
- **Element Type**: attribute
- **Obligation**: mandatory
- **Data type**: xs:string
- **Content**: enumeration list
- **Occurence**: 0..1
- **Definition**: funktion of the creator regarding the projekt.
- **Purpose and meaning**: This type attribute is used to build the landingpages and credit the persons according to they´re function. This attribute is only used if “nameType” has been set to “personal”. The options are “creator” and “collector”.
- **aditional information**: This attribute does not exist in DataCite or in previous versions of the schema. It was designed to allow the `<collector>` and `<sample_by>` elements to be grouped within the `<creator>` element, whilst still permitting differentiation so that landing pages can be structured accordingly.


### 3.1.2 [`<creatorName>`](#creatorName)
- **Element Type**: element
- **Obligation**: mandatory
- **Data type**: xs:complexType
- **Occurence**: 1..1
- **Definition**: full Name of the creator
- **Purpose and meaning**: This element stores the full name of the relevant creator,. full name in the format "family name, given name".
- **Mapping**:
|source scheme | element name|
|--|--|
|DataCite | [`<creatorName>`](https://datacite-metadata-schema.readthedocs.io/en/4.7/properties/creator/#creatorname)|
|IGSN Descriptive V1.3 |`<collector>`(ID 9), `<name>`(ID 9.2)|
|IGSN Supplementary V1.3 | `<sampled_by>` (ID 8), `<collector>` (ID 59)|
| IGSN Registration V1.3 |No corresponding item |


#### 3.1.2.1 [`@nameType`](#nameType)
- **Element Type**: attribute
- **Obligation**: mandatory
- **Data type**: daci:nameType
- **Content**: enumeration list
- **Occurence**: 1..1
- **Definition**: This attribute is used to specify the type of entry contained within the [`<name>`](#name) element.
- **Purpose and meaning**: It is used to distinguish the title of the registered sample from the sample’s common names.
- **Mapping**: <br>
|source scheme | element name|
|--|--|
|DataCite | [`@titleType`](https://datacite-metadata-schema.readthedocs.io/en/4.7/properties/title/#title) |
|IGSN Descriptive V1.3 |No corresponding item|
|IGSN Supplementary V1.3 | No corresponding item|
| IGSN Registration V1.3 | No corresponding item|
<br>
- **aditional information**: In order to c