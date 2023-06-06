class Job < ApplicationRecord
  has_and_belongs_to_many :skills

  has_many :matching_percentages
  has_many :jobseekers, through: :matching_percentages

  # def match_percentage(jobseeker_skills)
  #   common_skills = skills & jobseeker_skills
  #   (common_skills.count.to_f / skills.count.to_f * 100).round(2)
  # end

  # def matching_jobseekers
  #   Jobseeker.all.map do |jobseeker|
  #     [jobseeker, jobseeker.match_percentage(skills)]
  #   end.sort_by { |_, percentage| -percentage }
  # end

  # def matching_jobseekers
  #   Jobseeker.includes(:skills).map do |jobseeker|
  #     [jobseeker, MatchPercentageService.calculate(skills, jobseeker.skills)]
  #   end.sort_by { |_, percentage| -percentage }
  # end

  # Cache method to improve the performance, the problem is it will take large mount of memory if we have a huge mount of data
  # def matching_jobseekers
  #   Rails.cache.fetch("#{cache_key_with_version}/matching_jobseekers", expires_in: 12.hours) do
  #     Jobseeker.includes(:skills).map do |jobseeker|
  #       # matching_percentage = calculate_matching_percentage(jobseeker)
  #       [jobseeker, MatchPercentageService.calculate(skills, jobseeker.skills)]
  #     end.sort_by { |_, percentage| -percentage }
  #   end
  # end

  def matching_jobseekers
    matching_percentages.includes(:jobseeker)
                        .order(percentage: :desc)
                        .map { |match| [match.jobseeker, match.percentage] }
  end
end
