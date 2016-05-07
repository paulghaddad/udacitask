require "spec_helper"

describe StandardOutExporter do
  describe "#export" do
    it "exports a formatted todolist to standard out" do
      exporter = StandardOutExporter.new
      todolist = create_todolist_with_items

      expect { exporter.export(todolist) }.to output(formatted_todolist).to_stdout
    end
  end

  private

  def create_todolist_with_items
    todolist = TodoList.new("My New List")
    todolist.add_item("Item 1")
    todolist.add_item("Item 2")
    todolist.add_item("Item 3")
    todolist.items.first.assign_user("Paul")
    todolist
  end

  def formatted_todolist
<<FORMATTED_TODOLIST
-----------
My New List
-----------
1 - Item 1           Completed: false  Assignee: Paul
2 - Item 2           Completed: false  Assignee: None
3 - Item 3           Completed: false  Assignee: None

FORMATTED_TODOLIST
  end
end
