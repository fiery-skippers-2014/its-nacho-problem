class AddDefaultImageToRecipe < ActiveRecord::Migration
  def change
    change_column :recipes, :img_url, :string, :default => "http://imgur.com/YwmTBuJ"  
  end
end
