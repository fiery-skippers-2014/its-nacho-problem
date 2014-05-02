require 'spec_helper'

describe IngredientsController do
  it "should exist" do
    expect(response).to be_ok
  end

  xit "should have a search bar" do
    expect(page).to include "Search"
  end

end