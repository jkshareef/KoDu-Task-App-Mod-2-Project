class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.integer :task_id
      t.string :description
      t.string :date
      t.integer :duration
      t.integer :follower_id

      t.timestamps
    end
  end
end
