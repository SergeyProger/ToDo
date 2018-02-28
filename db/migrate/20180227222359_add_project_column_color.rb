class AddProjectColumnColor < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :colorpro, :integer
  end
end
