require "spec_helper"

describe Parser do
  describe "#parse" do
    it "delegates the #parse method to specific parser class" do
      specific_parser = spy("ParserInstance")
      file = double("JSON file")
      allow(specific_parser).to receive(:parse).with(file)
      generic_parser = Parser.new

      generic_parser.parse(specific_parser, file)

      expect(specific_parser).to have_received(:parse).with(file)
    end
  end
end
