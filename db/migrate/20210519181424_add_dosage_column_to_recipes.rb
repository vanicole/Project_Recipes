class AddDosageColumnToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :dosage, :string
  end
end
