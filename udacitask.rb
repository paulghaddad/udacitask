require './lib/todolist.rb'

class Udacitask
  # Creates a new todo list

  todolist = TodoList.new("My New List")

  # Add four new items

  todolist.add_item("Item 1")
  todolist.add_item("Item 2")
  todolist.add_item("Item 3")
  todolist.add_item("Item 4")

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
end
