# Namespace from http://tools.ietf.org/search/rfc4287#section-4.2.7.2
# Values from http://www.iana.org/assignments/link-relations/link-relations.xhtml
module RDF::Vocab
  class IANA < RDF::Vocabulary('http://www.iana.org/assignments/relation/')
    property :first
    property :last
    property :next
    property :prev
  end
end
