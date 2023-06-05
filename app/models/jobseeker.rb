class Jobseeker < ApplicationRecord
  has_and_belongs_to_many :skills

  # def matching_jobs
  #   Job.all.map do |job|
  #     [job, job.match_percentage(skills)]
  #   end.sort_by { |_, percentage| -percentage }
  # end

  # def match_percentage(job_skills)
  #   common_skills = skills & job_skills
  #   (common_skills.count.to_f / job_skills.count.to_f * 100).round(2)
  # end

  def matching_jobs
    Job.all.map do |job|
      [job, Skill.match_percentage(job.skills, skills)]
    end.sort_by { |_, percentage| -percentage }
  end
end
