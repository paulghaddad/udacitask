class StandardOutExporter
  attr_reader :todolist

  def export(todolist)
    @todolist = todolist
    print_header
    print_items
    puts
  end

  private

  def print_header
    print_header_border
    puts todolist.title
    print_header_border
  end

  def print_header_border
    puts "_" * todolist.title.length
  end

  def print_items
    todolist.items.each_with_index do |item, index|
      puts "#{index + 1} - #{item}"
    end
  end
end
