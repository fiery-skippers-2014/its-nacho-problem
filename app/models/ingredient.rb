class Ingredient < ActiveRecord::Base
	attr_accessible :name
	validates_presence_of :name
	validates_uniqueness_of :name

  has_many :user_ingredients
  has_many :users, through: :user_ingredients

  include PgSearch
  pg_search_scope :search_by_name, :against => :name, :using => [:dmetaphone, :trigram]

  def self.search(search)
  	Ingredient.search_by_name(search)
  end
 
end