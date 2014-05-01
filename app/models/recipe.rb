class Recipe < ActiveRecord::Base
  serialize :components
  attr_accessible :components
end