class AddVideoToRecipe < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipes, :video, foreign_key: true 
  end
end
