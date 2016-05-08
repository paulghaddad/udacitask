require "spec_helper"

describe JsonExporter do
  describe "#export" do
    it "exports a todolist in JSON format" do
      filename = "spec/test_json_file.json"
      exporter = JsonExporter.new(filename)
      todolist = create_todolist_with_items

      exporter.export(todolist)

      json_file = File.read(filename)
      expect(json_file).to eq(expected_json)

      File.delete(filename)
    end
  end

  private

  def expected_json
    "{\"title\":\"My New List\",\"items\":[{\"description\":\"Item 1\",\"completed_status\":false,\"assignee\":\"Paul\"},{\"description\":\"Item 2\",\"completed_status\":false,\"assignee\":\"None\"},{\"description\":\"Item 3\",\"completed_status\":false,\"assignee\":\"None\"}]}"
  end

  def create_todolist_with_items
    todolist = TodoList.new("My New List")
    todolist.add_item("Item 1")
    todolist.add_item("Item 2")
    todolist.add_item("Item 3")
    todolist.items.first.assign_user("Paul")
    todolist
  end
end
