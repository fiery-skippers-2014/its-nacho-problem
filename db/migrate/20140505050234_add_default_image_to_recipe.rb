class AddDefaultImageToRecipe < ActiveRecord::Migration
  def change
    change_column :recipes, :img_url, :binary, :default => "images/nachoprob"  
  end
end
