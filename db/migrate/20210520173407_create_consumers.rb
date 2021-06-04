class CreateConsumers < ActiveRecord::Migration[6.1]
  def change
    create_table :consumers do |t|
      t.string :username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
