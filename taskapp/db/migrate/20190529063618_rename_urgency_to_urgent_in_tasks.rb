class RenameUrgencyToUrgentInTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :urgency, :urgent
  end
end
