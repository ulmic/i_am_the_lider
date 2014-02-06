FactoryGirl.define do
  factory :rating_criterion, class: 'Rating::Criterion' do
    title
    stage
    maximum { generate :integer }
  end
end
