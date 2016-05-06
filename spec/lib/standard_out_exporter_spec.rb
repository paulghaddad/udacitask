require "spec_helper"

describe StandardOutExporter do
  describe "#export" do
    it "prints a formatted todolist" do
      todolist = create_todolist
      exporter = StandardOutExporter.new

      expect { exporter.export(todolist) }.to output(exported_todolist).to_stdout
    end
  end

  private

  def create_todolist
    todolist = TodoList.new("My New List")
    todolist.add_item("Item 1")
    todolist.add_item("Item 2")
    todolist.add_item("Item 3")
    todolist
  end

  def exported_todolist
<<-PRINTED_TODOLIST
___________
My New List
___________
1 - Item 1           Completed: false  Assignee: None
2 - Item 2           Completed: false  Assignee: None
3 - Item 3           Completed: false  Assignee: None

PRINTED_TODOLIST
  end
end
