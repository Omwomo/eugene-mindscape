FactoryBot.define do
  factory :comment do
    text { 'Sample Comment Text' }
    association :user
    association :post
  end
end
