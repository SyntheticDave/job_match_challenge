class Job < ApplicationRecord
  has_and_belongs_to_many :skills

  # def match_percentage(jobseeker_skills)
  #   common_skills = skills & jobseeker_skills
  #   (common_skills.count.to_f / skills.count.to_f * 100).round(2)
  # end

  # def matching_jobseekers
  #   Jobseeker.all.map do |jobseeker|
  #     [jobseeker, jobseeker.match_percentage(skills)]
  #   end.sort_by { |_, percentage| -percentage }
  # end

  def matching_jobseekers
    Jobseeker.all.map do |jobseeker|
      [jobseeker, Skill.match_percentage(skills, jobseeker.skills)]
    end.sort_by { |_, percentage| -percentage }
  end
end
