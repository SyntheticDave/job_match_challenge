FactoryBot.define do
  factory :matching_percentage do
    association :job
    association :jobseeker
    percentage { 0.75 }
  end
end
