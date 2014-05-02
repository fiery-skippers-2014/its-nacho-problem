class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |recipe|
      recipe.string :name
      recipe.string :recipe_url
      recipe.text   :components
      recipe.string :img_url
    end
  end
end
