require 'rails_helper'

RSpec.describe Jobseeker, type: :model do
  # Toy model spec to confirm Rspec is configured correctly
  describe "#name" do
    subject { js.name }
    let(:js) { build_stubbed(:jobseeker, name: js_name) }
    let(:js_name) { 'Test Jobseeker' }

    it { is_expected.to eq(js_name) }
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:skills) }
  end

  describe '#matching_jobs' do
    let!(:jobseeker) { create(:jobseeker, :with_skills, skills_count: 3) }
    let!(:skills) { create_list(:skill, 3) }
    let!(:job1) { create(:job) }
    let!(:job2) { create(:job) }
    let!(:job3) { create(:job) }
    let!(:job4) { create(:job) }

    before do
      job1.skills << jobseeker.skills
      job2.skills << (jobseeker.skills + skills)
      job3.skills << skills
    end

    it 'returns jobs sorted by match percentage' do
      expect(jobseeker.matching_jobs).to eq([[job1, 100.0], [job4, 100], [job2, 50.0], [job3, 0]]).or eq([[job4, 100.0], [job1, 100], [job2, 50.0], [job3, 0]])
    end

    it 'returns 100% match for job with same skills' do
      expect(jobseeker.matching_jobs).to include([job1, 100.0])
    end

    it 'returns 50% match for job with one extra skill' do
      expect(jobseeker.matching_jobs).to include([job2, 50.0])
    end

    it 'returns 0% match for job with no matching skills' do
      expect(jobseeker.matching_jobs).to include([job3, 0])
    end

    it 'returns 100% match for job without skills requirement' do
      expect(jobseeker.matching_jobs).to include([job4, 100])
    end
  end
end
