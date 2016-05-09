require "spec_helper"
require "./udacitask"

describe Udacitask do
  it "creates a list and exports it to standard out" do
    todolist = create_todolist

    expect { todolist.export_to_standard_out }.to output(formatted_todolist).to_stdout
  end

  it "exports a list to a JSON file" do
    todolist = create_todolist
    filename = "spec/test_json_file.json"

    todolist.export_to_json(filename)

    json_file = File.read(filename)
    expect(json_file).to eq(expected_json_output)

    File.delete(filename)
  end

  it "imports a list from a JSON file" do
    json_file = File.read("spec/data/sample_json_file.json")
    json_parser = JsonParser.new(json_file)
    parser = Parser.new

    todolist = parser.parse(json_parser)

    expect(todolist.title).to match(/My New List/)
    expect(todolist.items.size).to eq(3)
  end

  private

  def create_todolist
    todolist = TodoList.new("My New List")
    todolist.add_item(create_item("Item 1"))
    todolist.add_item(create_item("Item 2"))
    todolist.add_item(create_item("Item 3"))
    todolist
  end

  def create_item(description)
    Item.new(description)
  end

  def formatted_todolist
<<FORMATTED_TODOLIST
-----------
My New List
-----------
1 - Item 1           Completed: false  Assignee: None
2 - Item 2           Completed: false  Assignee: None
3 - Item 3           Completed: false  Assignee: None

FORMATTED_TODOLIST
  end

  def expected_json_output
    "{\"title\":\"My New List\",\"items\":[{\"description\":\"Item 1\",\"completed_status\":false,\"assignee\":\"None\"},{\"description\":\"Item 2\",\"completed_status\":false,\"assignee\":\"None\"},{\"description\":\"Item 3\",\"completed_status\":false,\"assignee\":\"None\"}]}"
  end
end

