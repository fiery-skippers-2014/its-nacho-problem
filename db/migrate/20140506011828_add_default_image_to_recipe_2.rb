class AddDefaultImageToRecipe2 < ActiveRecord::Migration
  def change
    change_column :recipes, :img_url, :string, :default => "/assets/nachoprob.png"  
  end
end
