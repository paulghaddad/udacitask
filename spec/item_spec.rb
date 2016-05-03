require "./todolist"

describe Item do
  context "initialized" do
    it "has a description" do
      item = Item.new("Item 1")

      description = item.description

      expect(description).to eq("Item 1")
    end

    it "has a completed status of false" do
      item = Item.new("Item 1")

      completed_status = item.completed_status

      expect(completed_status).to be false
    end
  end
end
