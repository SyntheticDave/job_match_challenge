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

  # Basic Version
  # def matching_jobs
  #   Job.includes(:skills).map do |job|
  #     [job, MatchPercentageService.calculate(job.skills, skills)]
  #   end.sort_by { |_, percentage| -percentage }
  # end

  # Cache method to improve the performance, the problem is it will take large mount of memory if we have a huge mount of data
  def matching_jobs
    Rails.cache.fetch("#{cache_key_with_version}/matching_jobs", expires_in: 12.hours) do
      Job.includes(:skills).map do |job|
        [job, MatchPercentageService.calculate(job.skills, skills)]
      end.sort_by { |_, percentage| -percentage }
    end
  end
end
