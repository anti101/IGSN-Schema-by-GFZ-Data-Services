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


## 1.1 [`@identifierType`](@identifierType) *mandatory Attribute*
- **Data type**: daci:relatedIdentifierType
- **Content**: enumeration list
- **Occurence**: 1..1
- **Definition**: The type of Identifier.
- **Purpose and meaning**: Mandatory for registration with DataCite.This attribute ensures that the type of the identifier can be specified correctly. This is necessary to ensure error-free machine processing


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
- **aditional information**: In order to clearly distinguish between `<title>`, `<name>` and `<alternateIdentifier>` within the schema, the decision was made not to align the element identifier `<name>` with DataCite's `<title>`, even though the `<name>` element is mapped to `<daci:title>` for registration purposes. The term ‘title’ summarises the content, attracts attention and serves as a structural guide for the reader. Here, however, `<name>` is used to capture all human-readable designations for the sample and to generate the title that corresponds to the registered resource.

## 2.1 [`@titleType`](#titleType)  *optional Attribute*
- **Data type**: daci:titleType
- **Content**: enumeration list
- **Occurence**: 0..1
- **Definition**: This attribute is used to specify the type of entry contained within the [`<name>`](#name) element.
- **Purpose and meaning**: It is used to distinguish the title of the registered sample from the sample’s common names.

## 2.2 [`@lang`](#lang) *optional Attribute*
- **Data type**: xs:language
- **Content**: enumeration list
- **Occurence**: 0..1
- **Definition**: distinguishes the language
- **Purpose and meaning**: Ensures that machines can unambiguously identify the language. This is listed as a required element only for the “Description” field, as a large amount of free text is entered there and it is therefore essential to specify the language used

---
---


# 3 [`<agents>`](#agents) *mandatory Element*
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
- **Data type**: xs:complexType
- **Content**: No entries expected
- **Occurence**: 1..1
-  **Definition**: A wrapper element that bundles all elements relating to specific persons and organizations
- **Purpose and meaning**: This wrapper is designed to group together all the agents (people and organizations) involved in the resource and make them available in a single location within the schema
- **aditional information**: As part of the harmonisation process, the elements relating to the people involved in the publication were grouped together to improve readability. This has made the schema easier to reuse and understand.

## 3.1 [`<creator>`](#creator) *mandatory Element*
- **Data type**: xs:complexType
- **Content**: free text
- **Occurence**: 1..n
- **Definition**:The creator wrapper contains a list of “the main researcher(s) involved...in priority order.” For IGSN IDs, this could be the sample collector/creator, chief scientist, curator, or even the person who deposited the sample into a repository. <br>
As a norm, IGSN ID registrants are expected to collect information about the sample owner, Principle Investigator, and/or otherwise. However, if no appropriate name is available, the property will be populated with the name of the IGSN ID Repository registrant
- **Purpose and meaning**: This element is required for registering the sample with DataCite; it contains all the information needed to uniquely identify the collector and/or creator of the resource

### 3.1.1 [`@creatorType`](#creatorType) *mandatory Attribute*
- **Data type**: xs:string
- **Content**: enumeration list
- **Occurence**: 0..1
- **Definition**: funktion of the creator regarding the projekt.
- **Purpose and meaning**: This type attribute is used to build the landingpages and credit the persons according to they´re function. This attribute is only used if `nameType` has been set to `personal`. The options are `creator` and `collector`.
- **aditional information**: This attribute does not exist in DataCite or in previous versions of the schema. It was designed to allow the `<collector>` and `<sample_by>` elements to be grouped within the `<creator>` element, whilst still permitting differentiation so that landing pages can be structured accordingly.


### 3.1.2 [`<creatorName>`](#creatorName) *mandatory Element*
- **Data type**: xs:complexType
- **Content**: free text
- **Occurence**: 1..1
- **Definition**: full Name of the creator
- **Purpose and meaning**: This element stores the full name of the relevant creator. Full name in the format "family name, given name".


#### 3.1.2.1 [`@nameType`](#nameType) *mandatory Attribute*
- **Data type**: daci:nameType
- **Content**: enumeration list
- **Occurence**: 1..1
- **Definition**: This attribute is used to specify the type of entry contained within the [`<name>`](#name) element.
- **Purpose and meaning**: It is used to distinguish the title of the registered sample from the sample’s common names.


#### 3.1.2.2 [`@lang`](#lang) *optional Attribute*
- **Data type**: xs:language
- **Content**: enumeration list
- **Occurence**: 0..1
- **Definition**: distinguishes the language
- **Purpose and meaning**: Ensures that machines can unambiguously identify the language. This is listed as a required element only for the “Description” field, as a large amount of free text is entered there and it is therefore essential to specify the language used


### 3.1.3 [`<givenName>`](#givenName) *optional Element*
- **Data type**: xs:complexType
- **Content**: free text
- **Occurence**: 0..1
- **Definition**: full Name of the Person
- **Purpose and meaning**: This element stores the full name of the relevant creator. full name in the format "family name, given name".


### 3.1.4 [`<familyName>`](#familyName) *optional Element*
- **Data type**: xs:complexType
- **Content**: free text
- **Occurence**: 0..1
- **Definition**: Family Name of the Person
- **Purpose and meaning**:This element is used to retrieve the person’s surname from the `<creator>` or  `<contributor>` element in normalised form


### 3.1.5 [`<nameIdentifier>`](#nameIdentifier) *optional Element*
- **Data type**: daci:nameIdentifier
- **Content**: free text
- **Occurence**: 0..1
- **Definition**: Uniquely identifies an individual or legal entity, according to various schemes. ORCID is pref for Person ROR is pref for Organizations
- **Purpose and meaning**:This element contains the identifier, which is used to uniquely identify the person or organization given in the parentelement e.g. the Contributer or the Archive. Only the identifier should be entered in this field; the full URL is taken from the @schemeURI attribute and processed, so only the identifier needs to be entered here


#### 3.1.5.1 [`<nameIdentifierScheme>`](#nameIdentifierScheme) *mandatory Attribute*
- **Data type**: xs:string
- **Content**: free text
- **Occurence**: 1..1
- **Definition**: The name of the name identifier scheme.
- **Purpose and meaning**:This attribute enables the `<nameIdentifier>` to be interpreted unambiguously and associated with a standardised identification system, such as ORCID, ISNI or ROR.

#### 3.1.5.2 [`<schemeURI>`](#schemeURI) *optional Attribute*
- **Data type**: xs:anyURI
- **Content**: URI
- **Occurence**: 0..1
- **Definition**: The URI of the name identifier scheme.
- **Purpose and meaning**:This attribute is used to store the identifier's URI


### 3.1.6 [`<affiliation>`](#affiliation) *optional Element*
- **Data type**: daci:affiliation
- **Content**: free text
- **Occurence**: 0..n
- **Definition**: The organizational or institutional affiliation of the creator.
- **Purpose and meaning**:This element is used to indicate the organization or institution the agent is affiliated with

#### 3.1.6.1 [`<affiliationIdentifier>`](#affiliationIdentifier) *optional Attribute*
- **Data type**: xs:string
- **Content**: free text
- **Occurence**: 0..1
- **Definition**: Uniquely identifies the organizational affiliation of the creator or contributer
- **Purpose and meaning**:This attribute is used to uniquely identify the affiliation

#### 3.1.6.1 [`<affiliationIdentifierScheme>`](#affiliationIdentifierScheme) *optional Attribute*
- **Data type**: xs:string
- **Content**: free text
- **Occurence**: 0..1
- **Definition**: The name of the affiliation identifier scheme.
- **Purpose and meaning**:This attribute enables the `@affilationIdentifier` attribute to be interpreted unambiguously and associated with a standardised identification system.

#### 3.1.6.3 [`<schemeURI>`](#schemeURI) *optional Attribute*
- **Data type**: xs:anyURI
- **Content**: URI
- **Occurence**: 0..1
- **Definition**: The URI of the affilation identifier scheme.
- **Purpose and meaning**:This attribute is used to store the identifier's URI


## 3.2 [`<contributor>`](#contributor) *optional Element*
- **Data type**: xs:complexType
- **Occurence**: 0..n
- **Definition**:A wrapper element that bundles all elements and attributes relating to specific persons with the funktion contributer
- **Purpose and meaning**: a bundle of all the elements and attributes required to uniquely identify a contributor

### 3.2.1 [`@contributorType`](#contributorType) *mandatory Attribute*
- **Data type**: daci:contributorType
- **Content**: enumeration list
- **Occurence**: 1..1
- **Definition**: The type of contributor of the resource.
- **Purpose and meaning**: Select a suitable item from the enumeration list; if a person contributes in more than one way and is to be represented, a further contributor must be created with the appropriate @contributerType

HIER

### 3.2.2 [`<contributorName>`](#contributorName) *mandatory Element*
- **Data type**: xs:complexType
- **Content**: free text
- **Occurence**: 1..1
- **Definition**:full name of the contributer
- **Purpose and meaning**:The institution or person responsible for collecting, managing, distributing, or otherwise contributing to the development of the resource. To supply multiple contributors, repeat this property.


#### 3.2.2.1 [`@contributorType`](#contributorType) *mandatory Attribute*
- **Data type**: daci:contributorType
- **Content**: enumeration list
- **Occurence**: 1..1
- **Definition**: The type of contributor of the resource.
- **Purpose and meaning**: Select a suitable item from the enumeration list; if a person contributes in more than one way and is to be represented, a further contributor must be created with the appropriate @contributerType


#### 3.2.2.2 [`@lang`](#lang) *optional Attribute*
- **Data type**: xs:language
- **Content**: enumeration list
- **Occurence**: 0..1
- **Definition**: distinguishes the language
- **Purpose and meaning**: Ensures that machines can unambiguously identify the language. This is listed as a required element only for the “Description” field, as a large amount of free text is entered there and it is therefore essential to specify the language used


### 3.2.3 [`<givenName>`](#givenName) *optional Element*
- **Data type**: xs:complexType
- **Content**: free text
- **Occurence**: 0..1
- **Definition**: given Name of the Person
- **Purpose and meaning**: This element is used to retrieve the first name of the person from the `<contributer>` element in normalised format.


### 3.2.4 [`<familyName>`](#familyName) *optional Element*
- **Data type**: xs:complexType
- **Content**: free text
- **Occurence**: 0..1
- **Definition**: Family Name of the Person
- **Purpose and meaning**:This element is used to retrieve the person’s surname from `<contributor>` element in normalised form


### 3.2.5 [`<nameIdentifier>`](#nameIdentifier) *optional Element*
- **Data type**: daci:nameIdentifier
- **Content**: free text
- **Occurence**: 0..1
- **Definition**: Uniquely identifies an individual or legal entity, according to various schemes. ORCID is pref for Person ROR is pref for Organizations
- **Purpose and meaning**:This element contains the identifier, which is used to uniquely identify the person or organization given in the `<contributer>` Element. Only the identifier should be entered in this field; the full URL is taken from the 
`@schemeURI` attribute and processed, so only the identifier needs to be entered here


#### 3.2.5.1 [`<nameIdentifierScheme>`](#nameIdentifierScheme) *mandatory Attribute*
- **Data type**: xs:string
- **Content**: free text
- **Occurence**: 1..1
- **Definition**: The name of the name identifier scheme. Only Mandatory if [`<nameIdentifier>`](#nameIdentifier) is used.
- **Purpose and meaning**:This attribute enables the `<nameIdentifier>` to be interpreted unambiguously and associated with a standardised identification system, such as ORCID, ISNI or ROR.

#### 3.2.5.2 [`<schemeURI>`](#schemeURI) *optional Attribute*
- **Data type**: xs:anyURI
- **Content**: URI
- **Occurence**: 0..1
- **Definition**: The URI of the name identifier scheme.
- **Purpose and meaning**:This attribute is used to store the identifier's URI


### 3.2.6 [`<affiliation>`](#affiliation) *optional Element*
- **Data type**: daci:affiliation
- **Content**: free text
- **Occurence**: 0..n
- **Definition**: The organizational or institutional affiliation of the person.
- **Purpose and meaning**:This element is used to indicate the organization or institution the agent is affiliated with

#### 3.2.6.1 [`<affiliationIdentifier>`](#affiliationIdentifier) *optional Attribute*
- **Data type**: xs:string
- **Content**: free text
- **Occurence**: 0..1
- **Definition**: Uniquely identifies the organizational affiliation of the person
- **Purpose and meaning**:This attribute is used to uniquely identify the affiliation

#### 3.2.6.1 [`<affiliationIdentifierScheme>`](#affiliationIdentifierScheme) *optional Attribute*
- **Data type**: xs:string
- **Content**: free text
- **Occurence**: 1..1
- **Definition**: The name of the affiliation identifier scheme.
- **Purpose and meaning**:This attribute enables the `@affilationIdentifier` attribute to be interpreted unambiguously and associated with a standardised identification system.

#### 3.2.6.3 [`<schemeURI>`](#schemeURI) *optional Attribute*
- **Data type**: xs:anyURI
- **Content**: URI
- **Occurence**: 0..1
- **Definition**: The URI of the affilation identifier scheme.
- **Purpose and meaning**:This attribute is used to store the identifier's URI


## 3.3 [`<publisher>`](#publisher) *mandatory Element*
- **Data type**: xs:complexType
- **Occurence**: 1..1
- **Definition**:This is the organization that registered the IGSN for this resource. It is also the entity that minted and manages this IGSN record.
- **Purpose and meaning**: necessary to provide a complete and DataCite-compliant statement identifying the publishing institution

### 3.3.1 [`<publisherIdentifier>`](#publisherIdentifier) *mandatory Attribute*
- **Data type**: xs:anyURI
- **Content**: URI
- **Occurence**: 1..1
- **Definition**: Uniquely identifies the publisher, according to various schemes.
- **Purpose and meaning**:Similar to `<nameIdentifier>` or `<affiliationIdentifier>`, this attribute is used to store the persistent identifier.  Although [`<nameIdentifier>`](#nameIdentifier) is modelled as an element and this attribute corresponds to the same concept in terms of content, it has been defined here as an attribute because the DataCite `<publisher>` element is being reused. This does result in a conceptual inconsistency, but compliance with DataCite is maintained.

### 3.3.2 [`<publisherIdentifierScheme>`](#publisherIdentifierScheme) *mandatory Attribute*
- **Data type**: xs:string
- **Content**: enumeration list
- **Occurence**: 1..1
- **Definition**:the name of the publisher identifier scheme.
- **Purpose and meaning**:Unambiguous, machine-processable mapping of the identifier schema to enable further processing. 

### 3.3.3 [`<schemeURI>`](#schemeURI) *mandatory Attribute*
- **Data type**: xs:anyURI
- **Content**: URI
- **Occurence**: 1..1
- **Definition**: The URI of the name identifier scheme.
- **Purpose and meaning**:This attribute is used to store the identifier's URI

### 3.3.3 [`@lang`](#lang) *optional Attribute*
- **Data type**: xs:language
- **Content**: enumeration list
- **Occurence**: 0..1
- **Definition**: distinguishes the language
- **Purpose and meaning**: Ensures that machines can unambiguously identify the language.

# 3 [`<entityTypeClassifications>`](#entityTypeClassifications) *mandatory Element*
``` xml 
<igsn:entityTypeClassifications>
		<igsn:resourceType resourceTypeGeneral="PhysicalObject">SamplingFeature</igsn:resourceType>
		<igsn:sampleTypeClassificationPlaceholder>PLACEHOLDER</igsn:sampleTypeClassificationPlaceholder>
		<igsn:material subjectScheme="Medium Vocabulary" schemeURI="http://vocabulary.odm2.org/medium" valueURI="http://vocabulary.odm2.org/medium/liquidAqueous" lang="en">Liquid aqueous</igsn:material>
		<igsn:alternateMaterial subjectScheme="String" schemeURI="http://www.altova.com/" valueURI="http://www.altova.com/" classificationCode="String" lang="en">String</igsn:alternateMaterial>
		<igsn:description descriptionType="Methods" lang="de">String</igsn:description>
	</igsn:entityTypeClassifications>
```
- **Data type**: xs:complexType
- **Content**: No entries expected
- **Occurence**: 1..1
-  **Definition**: Contains elements that describe the basic form of the registered sample.
- **Purpose and meaning**: Wrapper to hold all classification information about the resource
