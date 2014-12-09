require "rdf-vocab"

namespace :vocab do  
  RDF::Vocab.config.keys.sort.each do |vocab|
    desc "Generate \"#{vocab}\" vocabulary from source (`output' = file path)"
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
