class Ingredient < ActiveRecord::Base
	attr_accessible :name
	validates_presence_of :name
	validates_uniqueness_of :name

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])   # Added wildcards so that a search for cheese will also return creamcheese, cheesecake and cheddar cheese
    else
      find(:all)
    end
  end
end