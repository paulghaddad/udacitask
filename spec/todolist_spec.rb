require "./todolist"

describe TodoList do
  context "initialized" do
    it "has a title" do
      todolist = create_todolist("My new list")

      title = todolist.title

      expect(title).to eq("My new list")
    end

    it "has an empty list of items" do
      todolist = create_todolist

      items = todolist.items

      expect(items).to eq([])
    end
  end

  describe "#rename_list" do
    it "allows you to rename the list" do
      todolist = create_todolist("Original name")

      todolist.title = "New name"

      expect(todolist.title).to match(/New name/)
    end
  end

  describe "#add_item" do
    it "adds an item to the todolist" do
      todolist = create_todolist

      todolist.add_item("Item 1")

      expect(todolist.items.count).to eq(1)
    end
  end

  describe "#remove_item" do
    it "removes an item from the list" do
      todolist = create_todolist
      todolist.add_item("Item 1")
      todolist.add_item("Item 2")
      todolist.add_item("Item 3")

      todolist.remove_item("Item 2")

      expect(todolist.items.size).to eq(2)
    end
  end

  describe "#print_todolist" do
    it "prints a formatted todolist" do
      todolist = TodoList.new("My New List")
      todolist.add_item("Item 1")
      todolist.add_item("Item 2")
      todolist.add_item("Item 3")

      expect { todolist.print_todolist }.to output(printed_todolist).to_stdout
    end
  end

  private

  def create_todolist(title = "My new list")
    TodoList.new(title)
  end

  def printed_todolist
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
