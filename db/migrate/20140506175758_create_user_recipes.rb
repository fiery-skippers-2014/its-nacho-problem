class CreateUserRecipes < ActiveRecord::Migration
  def change
    create_table :user_recipes do |col|
      col.belongs_to :user
      col.belongs_to :recipe
    end
  end
end