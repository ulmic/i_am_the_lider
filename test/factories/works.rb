FactoryGirl.define do
  factory :work do
    file
    user
    link { generate :url }
  end
end
