require "./lib/todolist"
require "./lib/item"

class Udacitask
  # Creates a new todo list

  todolist = TodoList.new("My New List")

  # Add four new items
  item_1 = Item.new("Item 1")
  todolist.add_item(item_1)
  item_2 = Item.new("Item 2")
  todolist.add_item(item_2)
  item_3 = Item.new("Item 3")
  todolist.add_item(item_3)
  item_4 = Item.new("Item 4")
  todolist.add_item(item_4)

  # Print the list

  todolist.print_todolist

  # Delete the first item

  todolist.remove_item("Item 1")

  # Print the list

  todolist.print_todolist

  # Delete the second item

  todolist.remove_item("Item 2")

  # Print the list

  todolist.print_todolist

  # Update the completion status of the first item to complete

  first_item = todolist.items.first
  first_item.completed

  # Print the list

  todolist.print_todolist

  # Update the title of the list

  todolist.title = "My updated todolist"

  # Print the list

  todolist.print_todolist

  # Export as JSON file

  todolist.export_to_json("udacitask_json_file.json")
end
