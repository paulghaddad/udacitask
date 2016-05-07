class Item
  attr_reader :description, :users
  attr_accessor :completed_status, :assigned_user

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
    "#{description.ljust(16)} Completed: #{completed_status}  Assignee: #{assigned_user || "None"}"
  end

  def assign_user(user)
    self.assigned_user = user
  end

  def remove_user(name)
    self.assigned_user = nil
  end
end
