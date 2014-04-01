FactoryGirl.define do
  factory :event_report, class: "Event::Report" do
    description { generate :string }
    document { generate :file }
    event_id 1
    results { generate :string }
  end
end
