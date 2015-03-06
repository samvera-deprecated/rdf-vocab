RSpec.describe RDF::Vocab do

  describe ".generate" do
    let(:source) { File.expand_path("../../fixtures/dcterms.rdf", __FILE__) }
    before do
      allow(RDF::Vocab).to receive(:config) do
        { "test" => {
            "title" => "For testing only",
            "class_name" => "Test",
            "source" => source, 
            "uri" => "http://purl.org/dc/terms/"
          }
        }
      end
      StringIO.open do |strio|
        RDF::Vocab.generate("test", strio)
        strio.rewind
        eval(strio.read)
      end
    end
    after { RDF::Vocab.send(:remove_const, :Test) }
    it "should generate the vocabulary based on the config" do
      expect(RDF::Vocab::Test < ::RDF::StrictVocabulary("http://purl.org/dc/terms/")).to be true
      expect(RDF::Vocab::Test.creator).to be_a(RDF::Term)
    end
  end

end
