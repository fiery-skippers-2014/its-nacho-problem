FactoryGirl.define do
  factory :user do
    username { Faker::Name.name}
    email { Faker::Internet.email}
    password {Faker::Internet.password}

    factory :user_with_ingredients do 
      user_id { }
      ingredient_id { }
    end
  end

  factory :ingredient do 
    name { Faker::Name.name }
    user 
  end

  

end