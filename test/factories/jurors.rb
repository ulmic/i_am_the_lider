FactoryGirl.define do
  factory :juror do
    first_name { generate :string }
    last_name { generate :string }
    login
    password
    association :stage
  end
end
