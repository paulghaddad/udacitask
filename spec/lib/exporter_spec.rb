require "spec_helper"

describe Exporter do
  describe "#export" do
    it "exports to Standard Out if it receives a Standard Out Exporter" do
      exporter = Exporter.new
      standard_out_exporter = spy(StandardOutExporter)
      todolist = double("TodoList")

      exporter.export(standard_out_exporter, todolist)

      expect(standard_out_exporter).to have_received(:export).with(todolist)
    end
  end
end
