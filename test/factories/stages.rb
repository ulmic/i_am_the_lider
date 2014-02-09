FactoryGirl.define do
  factory :stage do
    title
    description { generate :string }
  end
end
