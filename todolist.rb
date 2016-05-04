require 'pry'
class TodoList
  attr_reader :items
  attr_accessor :title

  def initialize(list_title)
    @title = list_title
    @items = Array.new
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

  private

  def same_item?(item, item_description)
    item.description == item_description
  end
end

class Item
  attr_reader :description, :completed_status

  def initialize(item_description)
    @description = item_description
    @completed_status = false
  end
end
