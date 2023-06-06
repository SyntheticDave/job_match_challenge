class MatchingPercentage < ApplicationRecord
  belongs_to :job
  belongs_to :jobseeker

  validates :percentage, presence: true
  validates :job, uniqueness: { scope: :jobseeker }
end
