class ChangeStartTimeInTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :start_time, :string
  end
end
