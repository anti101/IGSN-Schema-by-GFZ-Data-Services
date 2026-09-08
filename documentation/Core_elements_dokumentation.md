# IGSN Core Documentation

# 1. `<identifier>` *mandatory Element*
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



# 2. `<name>` *mandatory Element*
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


#### 3.1.2.1 `@nameType` *mandatory Attribute*
- **Data type**: daci:nameType
- **Content**: enumeration list
- **Occurence**: 1..1
- **Definition**: This attribute is used to specify the type of entry contained within the [`<name>`](#2-name-mandatory-element) element.
- **Purpose and meaning**: It is used to distinguish the title of the registered sample from the sample’s common names.



#### 3.1.2.2 [`@lang`](#lang) *optional Attribute*
- **Data type**: xs:language
- **Content**: enumeration list
- **Occurence**: 0..1
- **Definition**: distinguishes the language
- **Purpose and meaning**: Ensures that machines can unambiguously identify the language.



### 3.1.3 [`<givenName>`](#givenName) *optional Element*
- **Data type**: xs:complexType
- **Content**: free text
- **Occurence**: 0..1
- **Definition**: Given name of the Person
- **Purpose and meaning**: use only if [`@nameType`](#nameType) is `personal`


### 3.1.4 [`<familyName>`](#familyName) *optional Element*
- **Data type**: xs:complexType
- **Content**: free text
- **Occurence**: 0..1
- **Definition**: Family Name of the person
- **Purpose and meaning**: use only if [`@nameType`](#nameType) is `personal`


### 3.1.5 [`<nameIdentifier>`](#nameIdentifier) *optional Element*
- **Data type**: daci:nameIdentifier
- **Content**: free text
- **Occurence**: 0..1
- **Definition**: Uniquely identifies an individual or legal entity, according to various schemes. ORCID is pref for Person ROR is pref for Organizations
- **Purpose and meaning**:This element contains the identifier, which is used to uniquely identify the person or organization


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

# 4 [`<entityTypeClassifications>`](#entityTypeClassifications) *mandatory Element*
``` xml 
<igsn:entityTypeClassifications>
		<igsn:resourceType resourceTypeGeneral="PhysicalObject">SamplingFeature</igsn:resourceType>
		<igsn:sampleTypeClassificationPlaceholder>PLACEHOLDER</igsn:sampleTypeClassificationPlaceholder>
		<igsn:material subjectScheme="Medium Vocabulary" schemeURI="http://vocabulary.odm2.org/medium" valueURI="http://vocabulary.odm2.org/medium/liquidAqueous" lang="en">Liquid aqueous</igsn:material>
		<igsn:alternateMaterial subjectScheme="Classification (Rock)" schemeURI="https://www.geosamples.org/vocabularies/classification-rock" lang="en">Igneous</igsn:alternateMaterial>
		<igsn:description descriptionType="Methods" lang="de">Drill>Electric>Holesaw
        </igsn:description>
	</igsn:entityTypeClassifications>
```
- **Data type**: xs:complexType
- **Content**: No entries expected
- **Occurence**: 1..1
-  **Definition**: Contains elements that describe the basic form of the registered sample.
- **Purpose and meaning**: Wrapper to hold all classification information about the resource


## 4.1 [`<resourceType>`](#resourceType) *mandatory Element*
- **Data type**: xs:complexType
- **Occurence**: 1..1
- **Definition**:Describe the basic form of the object that is registered.
- **Purpose and meaning**: An element declared as mandatory by DataCite.  A description of the resource. The resourceType property may be populated with resource types from external ontologies or shared vocabularies. In the absence of an agreed vocabulary, the use of the terms **material sample** or **feature-of-interest** are strongly recommended to at least distinguish between these sampling concepts. A material sample is a specialization of a larger feature-of-interest, which is typically the collection site. For example, in the Geosciences, a feature-of-interest might be a lake, tree, cross-section, transect, or borehole.

## 4.1.1 [`<resourceTypeGeneral>`](#resourceTypeGeneral) *mandatory Attribute*
- **Data type**: daci:resourceType 
- **Occurence**: 1..1
- **Definition**:The general type of a resource.
- **Purpose and meaning**: This attribute is required for DataCite-compliant registration. Value is fixed to "PhysicalObject"


## 4.2 [`<sampleTypeClassificationPlaceHolder>`](#sampleTypeClassificationPlaceHolder) *optional Element*
- **Data type**: xs:sting
- **Occurence**: 0..1
- **Content**:placeholder for the values that will be adopted from the SampleType Classification vocabulary currently under development


## 4.3 [`<material>`](#material) *optional Element*
- **Data type**: xs:sting
- **Occurence**: 0..n
- **Definition**:Subject or keyword describing the resource.
- **Content**: enumeration list
- **Purpose and meaning**:If none of the materials available via the VOC are suitable, you can select ‘Other’ here to use the free-text field in ‘alternateMaterial’ for your entry
- **additional information**:The elements `<material>`, `<classification>` and `<alternateMaterial>` are all mapped to the `<subject>` element in DataCite; however, to ensure that the elements can be correctly addressed for the creation of landing pages, they have been modelled in this schema version consistently with the element names of the previous versions. 


### 4.3.1 [`<subjectScheme >`](#subjectScheme ) *optional Attribute*
- **Data type**: xs:sting
- **Occurence**: 0..1
- **Definition**:The name of the subject scheme or authority if one is used.
- **Content**: free text
- **additional information**: To simplify reuse and mapping to DataCite, the attributes were not renamed; instead, they were reused in the form in which they appear in DataCite.

### 4.3.2 [`<schemeURI>`](#schemeURI) *optional Attribute*
- **Data type**: xs:anyURI
- **Content**: URI
- **Occurence**: 0..1
- **Definition**: The URI of the name identifier scheme.
- **Purpose and meaning**:This attribute is used to store the identifier's URI

### 4.3.3 [`<valueURI>`](#valueURI) *optional Attribute*
- **Data type**: xs:anyURI
- **Content**: URI
- **Occurence**: 0..1
- **Definition**: The URI of the subject term.
- **Purpose and meaning**:To unambiguously identify the term used in the element, the URI of the term can be stored in this attribute. If applicable, provide the direct URI or URL for the term used. If the vocabulary does not provide separate URIs for individual terms but instead uses IDs to identify them uniquely, the `@classificationCode` attribute can be used to provide this information.

### 4.3.4 [`<classificationCode>`](#classificationCode) *optional Attribute*
- **Data type**: sx:string
- **Content**: free text
- **Occurence**: 0..1
- **Definition**: The classification code used for the subject term in the subject scheme.
- **Purpose and meaning**:If applicable, provide the ID for the term used. If the vocabulary does not provide IDs for individual terms but they are presented on persistent URIs, use the @valueURI attribute to provide this information.
- **additional information**: Different vocabularies use different identifiers for their classification codes. The information you are looking for may therefore be hidden behind the following terms: UUID, termID, vocab-term-identifier, itemNumber, conceptID, key

### 4.3.5 [`@lang`](#lang) *optional Attribute*
- **Data type**: xs:language
- **Content**: enumeration list
- **Occurence**: 0..1
- **Definition**: distinguishes the language
- **Purpose and meaning**: Ensures that machines can unambiguously identify the language.


## 4.4 [`<alternateMaterial>`](#alternateMaterial) *optional Element*
- **Data type**: xs:sting
- **Occurence**: 0..n
- **Content**: enumeration list
- **Definition**:Subject, keyword, classification code, or key phrase describing the resource.
- **Purpose and meaning**:element to alow material classification for resources that do not match the availabel material vocabulrys.


### 4.4.1 [`<subjectScheme >`](#subjectScheme ) *optional Attribute*
- **Data type**: xs:sting
- **Occurence**: 0..1
- **Definition**:The name of the subject scheme or authority if one is used.
- **Content**: free text
- **additional information**: To simplify reuse and mapping to DataCite, the attributes were not renamed; instead, they were reused in the form in which they appear in DataCite.

### 4.4.2 [`<schemeURI>`](#schemeURI) *optional Attribute*
- **Data type**: xs:anyURI
- **Content**: URI
- **Occurence**: 0..1
- **Definition**: The URI of the name identifier scheme.
- **Purpose and meaning**:This attribute is used to store the identifier's URI

### 4.4.3 [`<valueURI>`](#valueURI) *optional Attribute*
- **Data type**: xs:anyURI
- **Content**: URI
- **Occurence**: 0..1
- **Definition**: The URI of the subject term.
- **Purpose and meaning**:To unambiguously identify the term used in the element, the URI of the term can be stored in this attribute. If applicable, provide the direct URI or URL for the term used. If the vocabulary does not provide separate URIs for individual terms but instead uses IDs to identify them uniquely, the `@classificationCode` attribute can be used to provide this information.

### 4.4.4 [`<classificationCode>`](#classificationCode) *optional Attribute*
- **Data type**: sx:string
- **Content**: free text
- **Occurence**: 0..1
- **Definition**: The classification code used for the subject term in the subject scheme.
- **Purpose and meaning**:If applicable, provide the ID for the term used. If the vocabulary does not provide IDs for individual terms but they are presented on persistent URIs, use the @valueURI attribute to provide this information.
- **additional information**: Different vocabularies use different identifiers for their classification codes. The information you are looking for may therefore be hidden behind the following terms: UUID, termID, vocab-term-identifier, itemNumber, conceptID, key

### 4.4.5 [`@lang`](#lang) *optional Attribute*
- **Data type**: xs:language
- **Content**: enumeration list
- **Occurence**: 0..1
- **Definition**: distinguishes the language
- **Purpose and meaning**: Ensures that machines can unambiguously identify the language.


## 4.5 [`<description>`](#description) *optional Element*
- **Data type**: xs:sting
- **Occurence**: 0..n
- **Content**: free text
- **Definition**:Descriptive text about the sample. Free text, anything else that might be useful to know about the sample at its 'birth'. 
- **Purpose and meaning**:This element is used to provide further details about the resource to be registered. All additional information that does not fit in any of the other categories. May be used for technical information or detailed information associated with. use a diffrent description element for every description you like to add, eg abstract, thethods, technical information, locality, collection. It is a best practice to supply a description.


### 4.5.1 [`@descriptionType`](#descriptionType) *mandatory Attribute*
- **Data type**: xs:language
- **Content**: enumeration list
- **Occurence**: 0..1
- **Definition**: The type of the Description.
- **Purpose and meaning**: Ensures that machines can unambiguously identify the language.
- **additional information**: If **other** is selected, the description must clearly state what it refers to, to ensure that it is processed correctly and appears in the right place on the landing page.

### 4.5.2 [`@lang`](#lang) *manatory Attribute*
- **Data type**: xs:language
- **Content**: enumeration list
- **Occurence**: 0..1
- **Definition**: distinguishes the language
- **Purpose and meaning**: Ensures that machines can unambiguously identify the language.
- **additional information**: As the [`<description>`](#description) can be repeated and contains the largest amount of natural language text this attribute is mandotory.

## 5 [`<dates>`](#dates) *mandatory Element*
``` xml
    <igsn:dates>
		<igsn:date dateType="Collected">2026-10-31</igsn:date>
		<igsn:date dateType="Other" dateInformation="Destroyed">2026-11-11</igsn:date>
		<igsn:date dateType="Available">2026-12-01</igsn:date>
		<igsn:publicationYear>2026</igsn:publicationYear>
	</igsn:dates>
```
- **Data type**: xs:complexType
- **Occurence**: 1..1
- **Definition**:contains all the dates, in regads to the sampel and the metadata
- **Purpose and meaning**:The wrapper does not contain any content of its own, but simply bundles all elements which are necessary to describe dates regarding to the sample

### 5.1 [`<date>`](#date) *optional Element*
- **Data type**: xs:sting
- **Content**: date in the format: YYYY, YYYY-MM-DD, YYYY-MM-DDThh:mm:ssTZD
- **Occurence**: 0..n
- **Definition**: any date relevant for the samle or the metadata entry


#### 5.1.1 [`@dateType`](#dateType) *mandatory Attribute*
- **Data type**: daci:dateType
- **Content**: enumeration list
- **Occurence**: 1..1
- **Definition**: enumeration list of possible dateTypes
- **Purpose and meaning**: This attribute is used to provide a more detailed description of the `<date>` element in order to unambiguously identify what the `<date>` element refers to

#### 5.1.1 [`@ladateInformationng`](#dateInformation) *optional Attribute*
- **Data type**: xs:language
- **Content**: free text
- **Occurence**: 0..1
- **Definition**: specific information about the date
- **Purpose and meaning**: If you select **Other** for [`@dateType`](#dateType), please use this attribute specify the context of the date


### 5.1 [`<publicationYear>`](#publicationYear) *mandatory Element*
- **Data type**: daci:yearType
- **Content**: Year of publikation in the format YYYY
- **Occurence**: 1..1
- **Definition**: year when the data was or will be made publicly availible, required for registration with Datatcite


## 6 [`<access>`](#access) *Element*
placeholder; final structure still under discussion

## 7 [`<archives>`](#archives) *Element*
placeholder; final structure still under discussion

## 8 [`<relationshipIdentifiers>`](#relationshipIdentifiers) *optional Element*
``` xml
    <igsn:relationshipIdentifiers>
		<igsn:alternateIdentifier alternateIdentifierType="LocalSampleName">E-GEOD-34814</igsn:alternateIdentifier>
		<igsn:parentIdentifier identifierType="IGSN" relationType="IsPartOf">GFBNO7002EHG0001</igsn:parentIdentifier>
		<igsn:relatedIdentifier identifierType="DOI" relationType="IsSourceOf">10.5880/gfz.khag.2025.006</igsn:relatedIdentifier>
	</igsn:relationshipIdentifiers>
```
- **Data type**: xs:complexType
- **Occurence**: 0..1
- **Definition**:wrapper to sort all identifiers representing resources having a relation to the registed resource
- **Purpose and meaning**:This wrapper is designed to collect and consolidate all information relating to resources associated with this resource, as well as the resource’s provenance
- **additional information**: The term `relationships` was chosen to make it clear that this wrapper encompasses all elements that serve to group together resources related to the registered resource or that represent the properties of the resource.

### 8.1 [`<alternateIdentifier>`](#alternateIdentifier) *optional Element*
- **Data type**: xs:string
- **Content**: free text
- **Occurence**: 0..n
- **Definition**:Identifiers other than the primary Identifier applied to the resource being registered. This may be any alphanumeric string which is unique within its domain of use. May be used for local identifiers. AlternateIdentifier should be used for another identifier of the same instance (same location, same file).
- **Purpose and meaning**:[`<alternateIdentifier>`](#alternateIdentifier) is used to provide supplementary referencing of a resource. It enables the resource to be identified using alternative identifiers that exist alongside the actual name or a primary identification number.

#### 8.1.1 [`<alternateIdentifierType>`](#alternateIdentifierType) *mandatory Attribute*
- **Data type**: xs:string
- **Content**: free text
- **Occurence**: 0..n
- **Definition**:The type of the  [`<alternateIdentifier>`](#alternateIdentifier) 
- **Purpose and meaning**:Mandatory only if  [`<alternateIdentifier>`](#alternateIdentifier) is used. This attribute is necessary to better understand the context in which the alternative identifier is used and to understand where the identifier comes from. Unlike [`@identifierType`](@identifierType), this attribute can accept free-form text to allow users to specify the exact context in which this alternative identifier is used.

### 8.2 [`<parentIdentifier>`](#parentIdentifier) *optional Element*
- **Data type**: xs:anyURI
- **Content**: IGSN of the parent resource
- **Occurence**: 0..1
- **Definition**:IGSN of a resource from which this resource derives
- **Purpose and meaning**: enables the unambiguous hierarchical assignment of relationships for samples.For the sake of readability and to remain consistent with previous schemas, this element has not been renamed to ‘relatedIdentifier’ as in DataCite, even though it is mapped to it.

#### 8.2.1 [`<relationType>`](#relationType) *mandatory Attribute*
- **Data type**: daci:relationType
- **Content**: enumeration list
- **Occurence**: 1..1
- **Definition**:This attribute is used to specify, in a machine-readable and standardised manner, the relationship.
- **Purpose and meaning**:When used in the  [`<parentIdentifier>`](#parentIdentifier) element, this attribute is fixed to `IsPartOf`, as this element only permits this relationship type.

### 8.3 [`<relatedIdentifier>`](#relatedIdentifier) *optional Element*
- **Data type**: xs:string
- **Content**: free text
- **Occurence**: 0..n
- **Definition**:Identifiers of related resources. These must be globally unique identifiers.
- **Purpose and meaning**: This element is used to retrieve the ID so that resources related to this sample can be linked.

#### 8.3.1 [`<relationType>`](#relationType) *mandatory Attribute*
- **Data type**: daci:relationType
- **Content**: enumeration list
- **Occurence**: 1..1
- **Definition**:This attribute is used to specify, in a machine-readable and standardised manner, the relationship between the resource specified in the element and the resource described here.

#### 8.3.2 [`<identifierType>`](#identifierType) *mandatory Attribute*
- **Data type**: daci:relatedIdentifierType
- **Content**: enumeration list
- **Occurence**: 1..1
- **Definition**:Type of identifier


## 9 [`<geoLocations>`](#geoLocations) *optional Element*
```xml
	<igsn:geoLocations>
		<igsn:geoLocationPlace lang="en">Potsdam</igsn:geoLocationPlace>
		<igsn:geoLocationPoint coordinateSystem="WGS84">
			<daci:pointLongitude>52.3786120</daci:pointLongitude>
			<daci:pointLatitude>13.06609315120018</daci:pointLatitude>
		</igsn:geoLocationPoint>
		<igsn:geoLocationBox coordinateSystem="WGS84">
			<daci:westBoundLongitude>5</daci:westBoundLongitude>
			<daci:eastBoundLongitude>13.060326321314756</daci:eastBoundLongitude>
			<daci:southBoundLatitude>52.38339986112071</daci:southBoundLatitude>
			<daci:northBoundLatitude>13.067579014491026</daci:northBoundLatitude>
		</igsn:geoLocationBox>
		<igsn:geoLocationPolygon>
			<igsn:polygonPoint coordinateSystem="WGS84">
				<daci:pointLongitude>13.066838</daci:pointLongitude>
				<daci:pointLatitude>52.380524</daci:pointLatitude>
			</igsn:polygonPoint>
			<igsn:polygonPoint coordinateSystem="WGS84">
				<daci:pointLongitude>13,060102</daci:pointLongitude>
				<daci:pointLatitude>52,379664</daci:pointLatitude>
			</igsn:polygonPoint>
			<igsn:polygonPoint coordinateSystem="WGS84">
				<daci:pointLongitude>13,06032</daci:pointLongitude>
				<daci:pointLatitude>52,382243</daci:pointLatitude>
			</igsn:polygonPoint>
			<igsn:polygonPoint coordinateSystem="WGS84">
				<daci:pointLongitude>13.066838</daci:pointLongitude>
				<daci:pointLatitude>52.380524</daci:pointLatitude>
			</igsn:polygonPoint>
		</igsn:geoLocationPolygon>
	</igsn:geoLocations>

```
- **Data type**: xs:complexType
- **Occurence**: 0..1
- **Definition**:wrapper for Spatial region or named place where the sample was gathered
- **Purpose and meaning**:aggregation of all information relating to the geographical resolution or extent of the registered sample

### 8.1 [`<geoLocationPlace>`](#geoLocationPlace) *optional Element*
- **Data type**: xs:string
- **Content**: free text
- **Occurence**: 0..n
- **Definition**:"Where was the sample acquired relative to the Earth (or another celestial body...). Some samples might be 'non-geographic': mineral specimen, synthetic material.
Named place where the data was gathered or about which the data is focused."
- **Purpose and meaning**:this element allows to enter a location without specifying coordinates, whilst still establishing a geographical reference
- **Additional Information**: Use to name or describe a geographic location. For a detailed description of the location where the samples were collected, use the [`<description>`](#description) element

#### 9.1.1 [`@lang`](#lang) *optional Attribute*
- **Data type**: xs:language
- **Content**: enumeration list
- **Occurence**: 0..1
- **Definition**: distinguishes the language
- **Purpose and meaning**: Ensures that machines can unambiguously identify the language.
- **additional information**: As the [`<description>`](#description) can be repeated and contains the largest amount of natural language text this attribute is mandotory.

