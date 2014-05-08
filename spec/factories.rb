FactoryGirl.define do

  factory :user do
    username { Faker::Name.first_name}
    email { Faker::Internet.email}
    password {Faker::Internet.password}
  end

  factory :ingredient do
    name { 'apple' }
  end

  factory :user_ingredient do
    user
    ingredient
  end

  factory :recipe do
    name {'apple pie'}
    recipe_url {'www.applepie.com'}
    components {['apple', 'pie']}
    img_url {Faker::Internet.domain_name}
  end


end