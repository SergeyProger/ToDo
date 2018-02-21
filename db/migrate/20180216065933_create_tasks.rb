class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string   :task_name
      t.integer  :priority
      t.datetime :time_done
      t.boolean  :completed

      t.timestamps
    end
  end
end
