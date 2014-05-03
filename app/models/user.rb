class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation

  validates_presence_of :password, :email, :on => :create
  validates :email, :uniqueness => true

  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients

  has_secure_password

  # has_many :ingredients
end
