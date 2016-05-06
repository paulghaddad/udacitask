class TodoList
  attr_reader :items
  attr_accessor :title

  def initialize(list_title)
    @title = list_title
    @items = Array.new
    @exporter = Exporter.new
  end

  def add_item(new_item)
    item = Item.new(new_item)
    @items.push(item)
  end

  def remove_item(item_description)
    items.delete_if do |item|
      same_item?(item, item_description)
    end
  end

  def export_to_standard_out
    exporter.export(StandardOutExporter.new, self)
  end

  private

  def same_item?(item, item_description)
    item.description == item_description
  end

end

class Item
  attr_reader :description, :users
  attr_accessor :completed_status, :assigned_user

  def initialize(item_description)
    @description = item_description
    @completed_status = false
  end

  def completed
    self.completed_status = true
  end

  def not_completed
    self.completed_status = false
  end

  def to_s
    "#{description.ljust(16)} Completed: #{completed_status}  Assignee: #{assigned_user || "None"}"
  end

  def assign_user(user)
    self.assigned_user = user
  end

  def remove_user(name)
    self.assigned_user = nil
  end
end
