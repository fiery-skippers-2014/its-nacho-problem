class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation

  validates_presence_of :password, :email, :on => :create
  validates :email, :uniqueness => true

  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients

  has_secure_password

  def get_name
    self.ingredients.map do |obj|
      obj.name 
    end
  end

  def find_recipe_by_pantry
    get_name.inject({}) {|hash, element| hash[element[0..[4, element.size].min]] = element; hash}
  end


end





