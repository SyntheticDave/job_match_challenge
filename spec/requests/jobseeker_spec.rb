require 'rails_helper'

RSpec.describe "Jobseekers", type: :request do
  describe "GET /index" do
    it "returns a successful response" do
      get jobseekers_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let(:jobseeker) { create(:jobseeker) }

    it "returns a successful response" do
      get jobseeker_path(jobseeker)
      expect(response).to be_successful
    end
  end
end
