class AddUrgencyToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :urgency, :boolean
  end
end
