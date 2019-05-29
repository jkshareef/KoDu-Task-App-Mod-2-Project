class AddSentToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :sent, :boolean
  end
end
