require 'rails_helper'

RSpec.describe "Jobs", type: :request do
  describe "GET /jobs" do
    let!(:jobs) { create_list(:job, 3) }

    it "returns http success" do
      get jobs_path
      expect(response).to have_http_status(:success)
    end

    it "returns all jobs" do
      get jobs_path
      jobs.each do |job|
        expect(response.body).to include(job.title)
      end
    end
  end

  describe "GET /jobs/:id" do
    let!(:job) { create(:job) }

    it "returns http success" do
      get job_path(job)
      expect(response).to have_http_status(:success)
    end

    it "returns the job title" do
      get job_path(job)
      expect(response.body).to include(job.title)
    end
  end

  describe "POST /jobs" do
    let!(:skills) { create_list(:skill, 3) }
    let(:valid_params) { { job: { title: 'Software Engineer', skill_ids: skills.map(&:id) } } }

    it "creates a new job" do
      expect {
        post jobs_path, params: valid_params
      }.to change(Job, :count).by(1)
    end

    it "redirects to the new job" do
      post jobs_path, params: valid_params
      expect(response).to redirect_to(job_path(Job.last))
    end

    it "enqueues a CalculateJobMatchingPercentagesWorker job" do
      expect {
        post jobs_path, params: valid_params
      }.to change(CalculateJobMatchingPercentagesWorker.jobs, :size).by(1)
    end
  end
end
