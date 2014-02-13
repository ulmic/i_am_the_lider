FactoryGirl.define do
  factory :stage do
    title
    description { generate :string }
    begin_date { generate :date }
    end_date{ generate :date }
    average { generate :integer }
  end
end
