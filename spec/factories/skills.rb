FactoryBot.define do
  # Note: This factory does not guarantee unique skill names
  factory :skill do
    name { Faker::Job.key_skill }
  end
end
