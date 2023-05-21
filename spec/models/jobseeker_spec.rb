require 'rails_helper'

RSpec.describe Jobseeker, type: :model do
  # Toy model spec to confirm Rspec is configured correctly
  describe "#name" do
    subject { js.name }
    let(:js) { build_stubbed(:jobseeker, name: js_name) }
    let(:js_name) { 'Test Jobseeker' }

    it { is_expected.to eq(js_name) }
  end
end
