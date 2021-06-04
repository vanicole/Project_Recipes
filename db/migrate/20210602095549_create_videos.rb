class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :link
      t.string :title
      t.string :uid
      t.integer :recipe_id

      t.timestamps
    end
    add_index :videos, :uid
  end
end
