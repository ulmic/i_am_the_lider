FactoryGirl.define do
  factory :event_photo, class: "Event::Photo" do
    file
    report_id 1
  end
end
