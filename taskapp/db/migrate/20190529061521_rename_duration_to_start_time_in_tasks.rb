class RenameDurationToStartTimeInTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :duration, :start_time
  end
end
