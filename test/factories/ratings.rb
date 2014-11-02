FactoryGirl.define do
  factory :rating do
    association :user
    association :juror
  end
end
