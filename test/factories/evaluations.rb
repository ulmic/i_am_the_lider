FactoryGirl.define do
  factory :evaluation do
    participant_id 1
    juror
    criterion
    value { generate :integer }
  end
end
