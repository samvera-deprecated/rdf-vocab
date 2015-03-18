<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:dcterms="http://purl.org/dc/terms/"    
    xmlns:iana="http://www.iana.org/assignments"
    exclude-result-prefixes="xs iana"
    version="1.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="relation" select="'http://www.iana.org/assignments/relation/'"/>
    <xsl:template match="/iana:registry">
        <rdf:RDF>
            <rdf:Description>
                <xsl:attribute name="rdf:about">
                    <xsl:value-of select="$relation"/>
                </xsl:attribute>
                <dcterms:title xml:lang="en">
                    <xsl:value-of select="iana:title"/>
                </dcterms:title>
                <dcterms:created rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
                    <xsl:value-of select="iana:created"/>
                </dcterms:created>
                <dcterms:modified rdf:datatype="http://www.w3.org/2001/XMLSchema#date">
                    <xsl:value-of select="iana:updated"/>
                </dcterms:modified>
                <dcterms:publisher rdf:resource="http://www.iana.org/"/>
                <dcterms:contributor>
                    <xsl:value-of select="iana:registry/iana:expert[1]"/>
                </dcterms:contributor>
                <rdfs:seeAlso rdf:resource="http://www.iana.org/assignments/link-relations/link-relations.xhtml"/>
            </rdf:Description>
            
            <xsl:for-each select="iana:registry/iana:record">
                <rdf:Property>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="$relation"/>
                        <xsl:value-of select="iana:value"/>
                    </xsl:attribute>
                    <rdfs:label xml:lang="en"><xsl:value-of select="iana:value"/></rdfs:label>
                    <rdfs:comment xml:lang="en"><xsl:value-of select="iana:description"/></rdfs:comment>
                    <xsl:if test="iana:spec/iana:xref[@type='rfc' or @type='uri']"></xsl:if>
                    <rdfs:seeAlso>
                        <xsl:attribute name="rdf:about">
                            <xsl:choose>
                                <xsl:when test="iana:spec/iana:xref[@type='rfc']">
                                    <xsl:value-of select="iana:spec/iana:xref/@data"/>
                                    <xsl:value-of select="iana:spec/text()"/>
                                </xsl:when>
                                <xsl:when test="iana:spec/iana:xref[@type='uri']">
                                    <xsl:value-of select="iana:spec/iana:xref/@data"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:attribute>
                    </rdfs:seeAlso>
                    <rdfs:isDefinedBy>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="$relation"/>
                        </xsl:attribute>
                    </rdfs:isDefinedBy>
                </rdf:Property>
            </xsl:for-each>
        </rdf:RDF>
    </xsl:template>
</xsl:stylesheet>