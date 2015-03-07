require "yaml"
require "uri"
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
        if param == "source"
          if URI.parse(value).scheme.nil? && !File.exists?(value)
            if File.exists?(path = File.join(File.expand_path("../../sources", __FILE__), value))
              value = path
            else
              raise IOError, "Source file not found."
            end
          end
        end
        loader.send("#{param}=", value)
      end
      loader.output = output if output # default: $stdout
      loader.run
    end

  end
end

Dir[File.expand_path("../rdf-vocab/vocab/**/*.rb", __FILE__)].each { |v| require v }
