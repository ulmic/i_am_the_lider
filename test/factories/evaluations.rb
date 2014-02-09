FactoryGirl.define do
  factory :evaluation do
    criterion_id 1
    rating_id 1
    value { generate :integer }
  end
end
