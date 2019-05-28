class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :date
      t.integer :duration
      t.integer :user_id

      t.timestamps
    end
  end
end
