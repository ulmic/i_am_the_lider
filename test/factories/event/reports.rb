FactoryGirl.define do
  factory :event_report, class: "Event::Report" do
    description { generate :string }
    document { generate :file }
    event
  end
end
