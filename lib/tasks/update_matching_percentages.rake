namespace :matching_percentages do
  desc 'Update all MatchingPercentages records'
  task update: :environment do
    Job.find_each do |job|
      CalculateJobMatchingPercentagesWorker.perform_async(job.id)
    end
  end
end
