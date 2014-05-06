class CreateUserRecipes < ActiveRecord::Migration
  def change
    create_table :recipes_users do |col|
      col.belongs_to :recipe
      col.belongs_to :user
    end
  end
end