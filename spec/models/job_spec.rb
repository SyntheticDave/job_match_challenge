# spec/models/job_spec.rb
require 'rails_helper'

RSpec.describe Job, type: :model do
  describe '#matching_jobseekers' do
    let!(:job) { create(:job, :with_skills, skills_count: 3) }
    let!(:skills) { create_list(:skill, 3) }
    let!(:jobseeker1) { create(:jobseeker) }
    let!(:jobseeker2) { create(:jobseeker) }
    let!(:jobseeker3) { create(:jobseeker) }
    let!(:jobseeker4) { create(:jobseeker) }

    before do
      jobseeker1.skills << job.skills
      jobseeker2.skills << (job.skills + skills)
      jobseeker3.skills << job.skills.first
    end

    it 'returns jobseekers sorted by match percentage' do
      expect(job.matching_jobseekers).to eq([[jobseeker1, 100.0], [jobseeker2, 100.0], [jobseeker3, 33.33], [jobseeker4, 0.00]])
    end

    it 'returns 100% match for jobseeker with same skills' do
      expect(job.matching_jobseekers).to include([jobseeker1, 100.0])
    end

    it 'returns 50% match for jobseeker with three extra skill' do
      expect(job.matching_jobseekers).to include([jobseeker2, 100.0])
    end

    it 'returns 33% match for jobseeker with one skills only' do
      expect(job.matching_jobseekers).to include([jobseeker3, 33.33])
    end

    it 'returns 0% match for jobseeker with no matching skills' do
      expect(job.matching_jobseekers).to include([jobseeker4, 0.0])
    end
  end
end
