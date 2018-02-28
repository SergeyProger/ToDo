FactoryBot.define do
  factory :task do
    task_name "Task"
    priority 2
    completed ''
    time_done '2018,9,16'
    project_id 1
  end
end