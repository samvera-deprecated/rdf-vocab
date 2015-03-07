require "rdf-vocab"

namespace :vocab do  
  RDF::Vocab.config.keys.sort.each do |vocab|
    params = RDF::Vocab.config[vocab] 
    name = [params.fetch("module_name", "RDF::Vocab"), params["class_name"]].join("::")
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

def vocab_classes(mod = RDF::Vocab, memo = {})
  mod.constants(false).each do |const|
    cls = mod.const_get(const)
    if cls.is_a?(Class) && cls < RDF::Vocabulary
      memo[cls.__name__] = cls
    elsif cls.is_a?(Module)
      vocab_classes(cls, memo)
    end
  end
  memo
end

namespace :vocabs do
  desc "List all vocabularies in this package and their URIs"
  task :list do
    vocabs = vocab_classes
    spaces = vocabs.keys.map(&:size).max + 2
    vocab_classes.keys.sort.each do |key|
      print "%-#{spaces}s" % key
      puts vocab_classes[key].to_uri.to_s
    end
  end
end
