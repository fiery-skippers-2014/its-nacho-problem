require 'spec_helper'

describe Ingredient do
  it {should have_db_column(:name)}
  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name)}
end