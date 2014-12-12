require "yaml"
require "rdf/cli/vocab-loader"

module RDF
  module Vocab

    def self.config
      @config ||= YAML.load_file(File.expand_path("../rdf-vocab/config/vocab.yml", __FILE__))
    end

    def self.generate(vocab, output=nil)
      loader = RDF::VocabularyLoader.new
      loader.module_name = "RDF::Vocab" unless config[vocab]["module_name"]
      config[vocab].each do |param, value|
        loader.send("#{param}=", value)
      end
      loader.output = output if output # default: $stdout
      loader.run
    end

  end
end

Dir[File.expand_path("../rdf-vocab/vocab/**/*.rb", __FILE__)].each { |v| require v }
