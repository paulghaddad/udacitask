require "./todolist"

describe Item do
  context "initialized" do
    it "has a description" do
      item = Item.new("Item 1")

      description = item.description

      expect(description).to eq("Item 1")
    end

    it "has a completed status of false" do
      item = create_item

      completed_status = item.completed_status

      expect(completed_status).to be false
    end
  end

  describe "#completed" do
    it "changes the completion status of an item to completed" do
      item = create_item

      item.completed

      expect(item.completed_status).to be true
    end
  end

  describe "#not_completed" do
    it "changes the completion status of an item to completed" do
      item = create_item
      item.completed

      item.not_completed

      expect(item.completed_status).to be false
    end
  end

  describe "#to_s" do
    it "outputs a formatted string with the item description and completion status" do
      item = create_item("Item 1")

      expect { puts item }.to output("Item 1           Completed: false\n").to_stdout
    end
  end
  private

  def create_item(description = "Item")
    Item.new(description)
  end
end
