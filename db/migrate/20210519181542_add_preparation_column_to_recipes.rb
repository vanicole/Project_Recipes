class AddPreparationColumnToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :preparation, :string
  end
end
