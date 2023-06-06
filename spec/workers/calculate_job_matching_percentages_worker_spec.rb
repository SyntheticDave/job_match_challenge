require 'rails_helper'
Sidekiq::Testing.fake!

RSpec.describe CalculateJobMatchingPercentagesWorker, type: :worker do
  let(:job) { create(:job, :with_skills) }
  let(:jobseeker) { create(:jobseeker, :with_skills) }

  it 'enqueues jobs correctly' do
    expect {
      CalculateJobMatchingPercentagesWorker.perform_async(job.id)
    }.to change(CalculateJobMatchingPercentagesWorker.jobs, :size).by(1)
  end

  it 'calculates matching percentages and saves them' do
    matching_percentage = MatchPercentageService.calculate(job.skills, jobseeker.skills)
    expect {
      CalculateJobMatchingPercentagesWorker.new.perform(job.id)
    }.to change { MatchingPercentage.count }.by(1)
    expect(MatchingPercentage.last.percentage).to eq(matching_percentage)
  end
end
