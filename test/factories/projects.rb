FactoryGirl.define do
  factory :project do
    user_id { generate :integer }
    date { generate :date}
    description { generate :string }
    goal { generate :string }
    place { generate :string }
    results { generate :string }
    target_audience { generate :string }
    tasks { generate :string } 
    title { generate :title }
  end
end
