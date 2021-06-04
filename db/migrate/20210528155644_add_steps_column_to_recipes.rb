class AddStepsColumnToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :steps, :text
  end
end
