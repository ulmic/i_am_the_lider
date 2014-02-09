FactoryGirl.define do
  factory :evaluation do
    participant_id 1
    juror_id 1
    criterion_id 1
    value { generate :integer }
  end
end
