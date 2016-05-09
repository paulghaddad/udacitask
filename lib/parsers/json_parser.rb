require "json"
require "todolist"

class JsonParser
  attr_reader :file, :parsed_json_file

  def initialize(file)
    @file = file
  end

  def parse
    @parsed_json_file = JSON.parse(file)
    create_todolist(parsed_json_file)
  end

  private

  def create_todolist(parsed_file)
    list_title = parsed_file["title"]
    todolist = TodoList.new(list_title)
    add_items_to_todolist(todolist)
    todolist
  end

  def add_items_to_todolist(todolist)
    parsed_items = parsed_json_file["items"]
    parsed_items.each do |parsed_item|
      item = create_item(parsed_item)
      todolist.add_item(item)
    end
  end

  def create_item(parsed_item)
    item = Item.new(parsed_item["description"])
    item.completed_status = parsed_item["completed_status"]
    item.assign_user(parsed_item["assignee"]) unless parsed_item["assignee"] == "None"
    item
  end
end
