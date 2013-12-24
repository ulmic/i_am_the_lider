FactoryGirl.define do
  factory :user do
    birth_date   { generate :date}
    district
    email
    first_name   { generate :string }
    last_name    { generate :string }
    group        { generate :string }
    home_phone   { generate :phone }
    login        { generate :login }
    middle_name  { generate :string }
    mobile_phone { generate :phone }
    password
    school       { generate :string }
    twitter      { generate :url }
    vkontakte    { generate :url }
    avatar       { generate :file }
    locality     { generate :string }
    adress_index "432000"
  end
end
