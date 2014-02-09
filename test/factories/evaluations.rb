FactoryGirl.define do
  factory :evaluation do
    user_id 1
    juror_id 1
    criterion_id 1
    value { generate :integer }
  end
end
