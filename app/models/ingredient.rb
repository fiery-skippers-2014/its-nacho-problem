class Ingredient < ActiveRecord::Base
	attr_accessible :name
	validates_presence_of :name
	validates_uniqueness_of :name

  has_many :user_ingredients
  has_many :users, through: :user_ingredients
end