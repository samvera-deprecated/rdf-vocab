require "rdf-vocab"

namespace :vocab do  
  RDF::Vocab.config.keys.sort.each do |vocab|
    params = RDF::Vocab.config[vocab] 
    name = [params.fetch("module_name", "RDF"), params["class_name"]].join("::")
    desc "Generate #{name} vocabulary from source"
    task vocab do
      if outfile = ENV["output"]
        File.open(outfile, "wb") do |output|
          RDF::Vocab.generate(vocab, output)
        end
      else
        RDF::Vocab.generate(vocab)
      end
    end
  end
end
