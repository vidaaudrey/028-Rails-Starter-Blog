class AddChefIdToRecipes < ActiveRecord::Migration
  def change
    # remove_column :recipes, :chef_id
    add_column :recipes, :chef_id, :integer
  end
end
