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

  def print_todolist
    print_todolist_header
    print_todolist_items
    puts
  end

  private

  def same_item?(item, item_description)
    item.description == item_description
  end

  def print_todolist_header
    print_header_border
    puts title
    print_header_border
  end

  def print_header_border
    puts "_" * title.length
  end

  def print_todolist_items
    items.each_with_index do |item, index|
      puts "#{index + 1} - #{item}"
    end
  end
end

class Item
  attr_reader :description
  attr_accessor :completed_status

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
    "#{description.ljust(16)} Completed: #{completed_status}"
  end
end
