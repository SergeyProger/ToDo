class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 100 }
  validates_presence_of :priority
  validates_presence_of :time_done

  belongs_to :project

  PRIORITIETS = [['Later', 1],['Next', 2],['Now', 3]]

  def complete!
    self.completed = true
    save
  end

  def priority_now!
    self.priority = 3
    save
  end

  def self.tasks_today
    @tasks = Task.all
    @tasks = @tasks.where(completed: false)
    @tasks = @tasks.where(time_done: DateTime.now..(DateTime.now + 1.day)).order('priority DESC')
    @tasks
  end

  def self.tasks_old
    @tasks = Task.all
    @tasks = @tasks.where(completed: false)
    @tasks = @tasks.where('time_done < datetime()')
    @tasks
  end

  def self.next_seven_day
    @tasks = Task.all
    @tasks = @tasks.where(completed: false)
    @tasks = @tasks.where(time_done: DateTime.now..(DateTime.now + 7.day)).order('priority DESC')
    @tasks
  end

end
