FactoryGirl.define do

  factory :user do
    username { Faker::Name.name}
    email { Faker::Internet.email}
    password {Faker::Internet.password}

  end

  factory :ingredient do 
    name { Faker::Lorem.word }
  end

  factory :user_ingredient do
    user
    ingredient
  end

  factory :recipe do 
    name {Faker::Lorem.word}
    recipe_url {Faker::Internet.url}
    components {[Faker::Lorem.word, Faker::Lorem.word, Faker::Lorem.word, Faker::Lorem.word]}
    img_url {Faker::Internet.url}
  end
  

end