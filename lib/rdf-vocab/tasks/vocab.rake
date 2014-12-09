require "rdf/cli/vocab-loader"
require "yaml"

namespace :vocab do
  desc "(Re-)Generate RDF vocabularies"
  task :generate do
    config = YAML.load_file(File.expand_path("../../config/vocab.yml", __FILE__))
    config.each do |prefix, params|
      loader = RDF::VocabularyLoader.new
      params.each do |param, value|
        loader.send("#{param}=", value)
      end
      outfile = File.expand_path("../../vocab/#{prefix}.rb", __FILE__)
      File.open(outfile, "wb") do |output|
        loader.output = output
        loader.run
      end
    end
  end
end
