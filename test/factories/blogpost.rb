FactoryGirl.define do
  factory :blog_post do
    text  { generate :string }
    title { generate :string }
    user
  end
end
