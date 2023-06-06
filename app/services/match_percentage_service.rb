class MatchPercentageService
  def self.calculate(job_skills, jobseeker_skills)
    common_skills = job_skills & jobseeker_skills

    return 100 if job_skills.count.zero? # Avoid division by zero

    (common_skills.count.to_f / job_skills.count.to_f * 100).round(2)
  end
end
