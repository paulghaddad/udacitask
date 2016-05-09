require "./lib/exporter"
require "./lib/exporters/standard_out_exporter"
require "./lib/exporters/json_exporter"

class TodoList
  attr_reader :items, :exporter
  attr_accessor :title

  def initialize(list_title)
    @title = list_title
    @items = Array.new
    @exporter = Exporter.new
  end

  def add_item(item)
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

  alias_method :print_todolist, :export_to_standard_out

  def export_to_json(filename = "json_export.json")
    exporter.export(JsonExporter.new(filename), self)
  end

  private

  def same_item?(item, item_description)
    item.description == item_description
  end
end
