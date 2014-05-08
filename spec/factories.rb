FactoryGirl.define do

  factory :user do
    username { Faker::Name.name}
    email { Faker::Internet.email}
    password {Faker::Internet.password}

  end

  factory :ingredient do 
    sequence(:name) {|n| "ingredient#{n}" }
  end

  factory :user_ingredient do
    user
    ingredient
  end

  factory :recipe do 
    sequence(:name) {|n| "name#{n}"}
    recipe_url {Faker::Internet.url}
    sequence(:components) {|n|["ingredient#{n}","ingredient#{n+1}","ingredient#{n+2}","ingredient#{n+3}" ]}
    img_url {Faker::Internet.url}
  end
  


end