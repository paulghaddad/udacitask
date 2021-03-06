require "spec_helper"

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

    it "has a default assignee as None" do
      item = create_item

      assignee = item.assignee

      expect(assignee).to eq("None")
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
    it "outputs a formatted string with the item description, completion status, and user assigned" do
      item = create_item("Item 1")
      item.assign_user("Paul")

      expect { puts item }.to output("Item 1           Completed: false  Assignee: Paul\n").to_stdout
    end
  end

  describe "#assign_user" do
    it "assigns a user to an item" do
      item = create_item
      user = create_user

      item.assign_user(user)

      expect(item.assignee).to eq(user)
    end
  end

  describe "#remove_user" do
    it "removes a specific user from an item" do
      item = create_item
      user = create_user("Mike")
      item.assign_user(user)

      item.remove_user("Mike")

      expect(item.assignee).to_not eq(user)
    end
  end

  private

  def create_item(description = "Item")
    Item.new(description)
  end

  def create_user(name = "Paul")
    User.new(name)
  end
end
