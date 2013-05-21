FactoryGirl.define do
  factory :report do
    date           { generate :date }
    member_count   { generate :integer }
    member_type    { generate :string }
    venue          { generate :string }
    #archive       {}
    description    { generate :string }
    user
    state          { generate :string }
  end
end
