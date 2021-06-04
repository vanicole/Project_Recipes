class RemoveColumnToRecipe < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :user_id, :string
  end
end
