class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 100 }
  validates_presence_of :priority

  belongs_to :project

  PRIORITIETS = [['Later', 1],['Next', 2],['Now', 3]]

  def complete!
    self.completed = true
    save
  end
end
