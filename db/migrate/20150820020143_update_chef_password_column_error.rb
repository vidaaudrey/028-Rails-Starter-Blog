class UpdateChefPasswordColumnError < ActiveRecord::Migration
  def change
    rename_column :chefs, :passoword_digest, :password_digest 
  end
end
