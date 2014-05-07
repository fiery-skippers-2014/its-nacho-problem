class AddDefaultImageToRecipe3 < ActiveRecord::Migration
  def change
    change_column :recipes, :img_url, :string, :default => "http://i.imgur.com/YwmTBuJ.png"  
  end
end
