require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:jobseekers) }
    it { should have_and_belong_to_many(:jobs) }
  end
end
