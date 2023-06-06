class CalculateJobMatchingPercentagesWorker
  include Sidekiq::Worker

  def perform(job_id)
    job = Job.find(job_id)
    Jobseeker.includes(:skills).each do |jobseeker|
      matching_percentage = MatchPercentageService.calculate(job.skills, jobseeker.skills)

      MatchingPercentage.find_or_initialize_by(job: job, jobseeker: jobseeker).update!(percentage: matching_percentage)
    end
  end
end
