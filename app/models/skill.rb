class Skill < ApplicationRecord
  has_and_belongs_to_many :jobseekers
  has_and_belongs_to_many :jobs

  def self.match_percentage(job_skills, jobseeker_skills)
    common_skills = job_skills & jobseeker_skills

    return 100 if job_skills.count.zero?

    (common_skills.count.to_f / job_skills.count.to_f * 100).round(2)
  end
end
