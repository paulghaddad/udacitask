require "spec_helper"

describe Parser do
  describe "#parse" do
    it "delegates the #parse method to a specific parser class" do
      specific_parser = spy("ParserInstance")
      allow(specific_parser).to receive(:parse)
      generic_parser = Parser.new

      generic_parser.parse(specific_parser)

      expect(specific_parser).to have_received(:parse)
    end
  end
end
