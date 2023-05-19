class Skill < ApplicationRecord
  has_and_belongs_to_many :jobseekers
  has_and_belongs_to_many :jobs
end
