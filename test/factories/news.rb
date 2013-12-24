FactoryGirl.define do
  factory :news do
    body { generate :string}
    pusblished_at { generate :date }
    title { generate :string }
    photo { generate :file }
  end
end
