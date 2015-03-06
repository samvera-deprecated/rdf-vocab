require "rdf-vocab"

def vocabs
  RDF::Vocab.config.keys.sort.each_with_object({}) do |vocab, memo|
    params = RDF::Vocab.config[vocab] 
    name = [params.fetch("module_name", "RDF::Vocab"), params["class_name"]].join("::")
    memo[vocab] = name
  end
end

namespace :vocab do  
  vocabs.each do |vocab, name|
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

namespace :vocabs do
  desc "List all vocabularies in this package and their URIs"
  task :list do
    vocabs.each do |key, vocab_cls|
      vocab = Object.const_get(vocab_cls)
      title = RDF::Vocab.config[key]["title"]
      title.prepend("-- ") if title
      uri = vocab.to_uri.to_s
      puts <<-EOS
#{vocab_cls} #{title}
    #{uri}

      EOS
    end
  end
end
