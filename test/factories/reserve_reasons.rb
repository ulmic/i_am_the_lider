FactoryGirl.define do
  factory :reserve_reason do
    description { generate :string }
    user
  end
end
