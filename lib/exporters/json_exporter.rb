require "json"

class JsonExporter
  attr_reader :filename, :todolist

  def initialize(filename)
    @filename = filename
  end

  def export(todolist)
    @todolist = todolist
    export_to_file
  end

  private

  def export_to_file
    File.open(filename, "w") do |file|
      file.print as_json
    end
  end

  def as_json
    JSON.dump(json_data)
  end

  def json_data
    {
      title: todolist.title,
      items: items_as_json(todolist.items)
    }
  end

  def items_as_json(items)
    items.map do |item|
      {"description"=>item.description,"completed_status"=>item.completed_status,"assignee"=>item.assignee}
    end
  end
end
