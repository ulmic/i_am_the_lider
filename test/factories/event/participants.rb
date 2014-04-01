FactoryGirl.define do
  factory :event_participant, class: "Event::Participant" do
    full_name { generate :string }
    phone
    school { generate :string }
    group { generate :string }
    report_id 1
  end
end
