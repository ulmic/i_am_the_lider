FactoryGirl.define do
  factory :event_report, class: "Event::Report" do
    description { generate :string }
    document { generate :file }
    association :event
    results { generate :string }
  end
end
