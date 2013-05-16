FactoryGirl.define do
  factory :admin do
    login   	{ generate :string }
    password	{ generate :string }
  end
end
