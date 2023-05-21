FactoryBot.define do
  factory :job do
    title { Faker::Job.title }

    # NOTE: This trait only works with create, not build
    trait :with_skills do
      transient do
        skills_count { 3 }
      end

      after(:create) do |job, evaluator|
        # Ensure we have the required number of skills in the DB
        skills_needed = evaluator.skills_count - Skill.count
        create_list(:skill, skills_needed) if skills_needed > 0

        # Assign 3 to the job at random
        skills = Skill.order(Arel.sql('RANDOM()')).first(evaluator.skills_count)
        job.skills << skills
      end
    end
  end
end
