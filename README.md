RDF::Vocab
==========

A library of RDF vocabularies generated from RDF schema and web ontologies (OWL) using the ruby-rdf vocab-loader.

[![Gem Version](https://badge.fury.io/rb/rdf-vocab.svg)](http://badge.fury.io/rb/rdf-vocab)
[![Build Status](https://travis-ci.org/projecthydra-labs/rdf-vocab.svg?branch=master)](https://travis-ci.org/projecthydra-labs/rdf-vocab)

See the list of rake tasks in the `vocab` namespace for specific vocabulary generators.

## Vocabularies

- RDF::Vocab::ACL - [Web Access Control](http://www.w3.org/wiki/WebAccessControl) (W3C)
- RDF::Vocab::Identifiers - [Standard Identifiers Scheme](http://id.loc.gov/vocabulary/identifiers.html) (LoC)
- RDF::Vocab::LDP - [Linked Data Platform](http://www.w3.org/TR/ldp/) (W3C)
- RDF::Vocab::MADS - [Metadata Authority Description Schema](http://www.loc.gov/standards/mads/) (LoC) 
- RDF::Vocab::MARCRelators - [MARC Code List for Relators](http://id.loc.gov/vocabulary/relators.html) (LoC)
- RDF::Vocab::MODS - [Metadata Object Description Schema](http://www.loc.gov/standards/mods/) (LoC)
- RDF::Vocab::PREMIS::V1 - [Preservation Metadata Implementation Strategies (PREMIS) Ontology](http://id.loc.gov/ontologies/premis.html) (LoC)
- RDF::Vocab::PremisEventType - [PREMIS Event Type](http://id.loc.gov/vocabulary/preservation/eventType.html) (LoC)

## Installation

Add to your Gemfile

    gem "rdf-vocab"

then

    bundle install
    
## Usage

    require "rdf-vocab"
    
This will load all the vocabulary classes in the library.
