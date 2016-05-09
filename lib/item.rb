class Item
  attr_reader :description
  attr_accessor :completed_status, :assignee

  def initialize(item_description)
    @description = item_description
    @completed_status = false
    @assignee = "None"
  end

  def completed
    self.completed_status = true
  end

  def not_completed
    self.completed_status = false
  end

  def to_s
    "#{description.ljust(16)} Completed: #{completed_status}  Assignee: #{assignee}"
  end

  def assign_user(user)
    self.assignee = user
  end

  def remove_user(name)
    self.assignee = nil
  end
end
