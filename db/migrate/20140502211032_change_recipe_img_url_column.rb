class ChangeRecipeImgUrlColumn < ActiveRecord::Migration
  def change
    change_column :recipes, :img_url, :text
  end
end
