FactoryGirl.define do
  factory :report do
    date           { generate :date }
    member_count   { generate :integer }
    member_type    { generate :string }
    venue          { generate :string }
    #archive       {}
    user_id        { generate :integer }
    description    { generate :string }
  end
end