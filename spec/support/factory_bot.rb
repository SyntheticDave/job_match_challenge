require 'factory_bot'

RSpec.configure do |config|
  # Allow use of FactoryBot methods without prefixing with FactoryBot
  # e.g. create(:jobseeker) instead of FactoryBot.create(:jobseeker)
  config.include FactoryBot::Syntax::Methods
end
