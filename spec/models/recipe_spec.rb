require 'spec_helper'

describe Recipe do
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:ingredients)}
  it {should validate_presence_of(:recipe_url)}
  it {should validate_uniqueness_of(:name)}
  it {should validate_uniqueness_of(:recipe_url)}
end