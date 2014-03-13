FactoryGirl.define do
  factory :event do
    adress { generate :url }
    begin_date { generate :date }
    end_date { generate :date }
    description { generate :string }
    goal { generate :string }
    participant_category { generate :string }
    tasks { generate :string }
    title
    user_id 1
  end
end
