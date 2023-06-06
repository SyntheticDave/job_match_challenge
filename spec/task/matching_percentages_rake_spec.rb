require 'rails_helper'
require 'rake'

RSpec.describe "matching_percentages:update" do
  let(:job) { create(:job) }

  before do
    Rake.application.rake_require "tasks/update_matching_percentages"
    Rake::Task.define_task(:environment)
  end

  it "enqueues CalculateJobMatchingPercentagesWorker for each job" do
    allow(CalculateJobMatchingPercentagesWorker).to receive(:perform_async)
    create_list(:job, 3)

    expect(CalculateJobMatchingPercentagesWorker).to receive(:perform_async).exactly(3).times
    Rake::Task["matching_percentages:update"].invoke
  end
end
