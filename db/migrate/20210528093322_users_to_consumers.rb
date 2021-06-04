class UsersToConsumers < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :consumer_id
    add_column :reviews, :user_id, :reference
    drop_table :consumers 
  end
end
