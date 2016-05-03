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

  describe "#add_item" do
    it "adds an item to the todolist" do
      todolist = create_todolist

      todolist.add_item("Item 1")

      expect(todolist.items.count).to eq(1)
    end
  end

  private

  def create_todolist(description = "My new list")
    TodoList.new(description)
  end
end
