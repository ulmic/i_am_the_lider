FactoryGirl.define do
  factory :criterion do
    title
    stage
    maximum { generate :integer }
  end
end
