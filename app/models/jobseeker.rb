class Jobseeker < ApplicationRecord
  has_and_belongs_to_many :skills
end
