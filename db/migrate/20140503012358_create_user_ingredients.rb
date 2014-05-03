class CreateUserIngredients < ActiveRecord::Migration
  def change
    create_table :user_ingredients do |t|
      t.belongs_to :user
      t.belongs_to :ingredients 
    end 
  end
end
