class RemoveSentFromRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :sent, :boolean
  end
end
