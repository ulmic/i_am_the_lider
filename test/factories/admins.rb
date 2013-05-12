FactoryGirl.define do
  factory :admin do
    login   { generate :string }
    password
  end
end
