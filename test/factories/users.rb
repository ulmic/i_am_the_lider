FactoryGirl.define do
  factory :user do
    birth_date   { generate :age18}
    district
    email
    first_name   { generate :string }
    last_name    { generate :string }
    group        { generate :string }
    home_phone   { generate :phone }
    middle_name  { generate :string }
    mobile_phone { generate :phone }
    password
    school       { generate :string }
    twitter      { generate :url }
    vkontakte    { generate :url }
    avatar       { generate :file }
    locality     { generate :string }
    last_stage_id 1
    adress_index "432000"
    confirm_state :new
  end
end
