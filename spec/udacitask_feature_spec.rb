require "spec_helper"
require "./udacitask"

describe Udacitask do
  it "creates a list and exports it to standard out" do
    todolist = TodoList.new("My New List")
    todolist.add_item("Item 1")
    todolist.add_item("Item 2")
    todolist.add_item("Item 3")

    expect { todolist.export_to_standard_out }.to output(formatted_todolist).to_stdout
  end

  private

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
end

