require "spec_helper"

describe JsonParser do
  describe "#parse" do
    it "parses the provided file and returns a Todolist" do
      json_file = File.read("spec/data/sample_json_file.json")
      json_parser = JsonParser.new(json_file)

      todolist = json_parser.parse

      expect(todolist.title).to match(/My New List/)
      expect(todolist.items.size).to eq(3)

      items = todolist.items

      expect(items[0].description).to match(/Item 1/)
      expect(items[0].completed_status).to be false
      expect(items[0].assignee).to match(/None/)
    end
  end
end
