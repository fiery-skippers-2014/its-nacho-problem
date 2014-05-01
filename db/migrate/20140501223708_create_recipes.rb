class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |recipe|
      recipe.string :name
      recipe.string :img_url
      recipe.string :recipe_url
      recipe.text   :components
    end
  end
end
