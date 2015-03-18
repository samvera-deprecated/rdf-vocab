RDF::Vocab
==========

A library of RDF vocabularies generated from RDF schema and web ontologies (OWL) using the ruby-rdf vocab-loader.

[![Gem Version](https://badge.fury.io/rb/rdf-vocab.svg)](http://badge.fury.io/rb/rdf-vocab)
[![Build Status](https://travis-ci.org/projecthydra-labs/rdf-vocab.svg?branch=master)](https://travis-ci.org/projecthydra-labs/rdf-vocab)

See the list of rake tasks in the `vocab` namespace for specific vocabulary generators.

## Vocabularies

- RDF::Vocab::ACL - [Web Access Control](http://www.w3.org/wiki/WebAccessControl) (W3C)
- RDF::Vocab::Bibframe - [Bibliographic Framework Initiative](http://bibframe.org/vocab/) (LoC)
- RDF::Vocab::CRM - [CIDOC Conceptual Reference Model (CRM); ISO 21127:2014](http://www.cidoc-crm.org/official_release_cidoc.html)
- RDF::Vocab::DataCite - [DataCite Ontology](http://purl.org/spar/datacite/)
- RDF::Vocab::DWC - [Darwin Core](http://rs.tdwg.org/dwc/terms/)
- RDF::Vocab::EDM - [Europeana Data Model](http://labs.europeana.eu/api/linked-open-data/data-structure/)
- RDF::Vocab::Fcrepo3 (module) - [Fedora Commons Repository 3](https://github.com/fcrepo3)*
- RDF::Vocab::Fcrepo4 - [Fedora Commons Repository 4 Ontology](http://fedora.info/definitions/v4/repository)
- RDF::Vocab::IANA - [Link Relations](http://www.iana.org/assignments/link-relations/link-relations.xhtml) (IANA)
- RDF::Vocab::Identifiers - [Standard Identifiers Scheme](http://id.loc.gov/vocabulary/identifiers.html) (LoC)
- RDF::Vocab::LDP - [Linked Data Platform](http://www.w3.org/TR/ldp/) (W3C)
- RDF::Vocab::MADS - [Metadata Authority Description Schema](http://www.loc.gov/standards/mads/) (LoC) 
- RDF::Vocab::MARCRelators - [MARC Code List for Relators](http://id.loc.gov/vocabulary/relators.html) (LoC)
- RDF::Vocab::MODS - [Metadata Object Description Schema](http://www.loc.gov/standards/mods/) (LoC)
- RDF::Vocab::OA - [Open Annotation Data Model](http://www.w3.org/ns/oa) (W3C)
- RDF::Vocab::ORE - [Object Reuse and Exchange Ontology](http://www.openarchives.org/ore/1.0/rdfxml) (OAI)
- RDF::Vocab::PREMIS::V1 - [Preservation Metadata Implementation Strategies (PREMIS) Ontology](http://id.loc.gov/ontologies/premis.html) (LoC)
- RDF::Vocab::PROV - [PROV Ontology](http://www.w3.org/TR/prov-o/) (W3C)
- RDF::Vocab::PremisEventType - [PREMIS Event Type](http://id.loc.gov/vocabulary/preservation/eventType.html) (LoC)

* The Fcrepo3 module was extracted from [ActiveFedora](https://github.com/projecthydra/active_fedora), so does not have a generator task.

## Installation

Add to your Gemfile

    gem "rdf-vocab"

then

    bundle install
    
## Usage

    require "rdf-vocab"
    
This will load all the vocabulary classes in the library.
