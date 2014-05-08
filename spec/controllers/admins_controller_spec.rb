#!/bin/env ruby
# encoding: utf-8
require 'spec_helper'

describe AdminsController do
  let(:result) { JSON.parse(File.read(File.expand_path("../../api_result.json", __FILE__))) }
  let!(:user){FactoryGirl.create :user}

  context "#create" do

    it "should save recipe to the database" do
      controller.stub(:yummly_search_result){result}
      expect {
        post :create, '/admins' => {ingredient: 'any', max_result: 'any'}
      }.to change {Recipe.count}.by(9)
    end

    it "should save new ingredients to the database" do
      controller.stub(:yummly_search_result){result}
      expect {
        post :create, '/admins' => {ingredient: 'any', max_result: 'any'}
      }.to change {Ingredient.count}
    end

    it "should not create with invalid params" do
      controller.stub(:yummly_search_result) {""}
      expect {
        post :create, '/admins' => {ingredient: 'any', max_result: 'any'}
      }.not_to change {Recipe.count}
    end
  end
end