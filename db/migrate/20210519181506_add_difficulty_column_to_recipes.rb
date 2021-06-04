class AddDifficultyColumnToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :difficulty, :string
  end
end
