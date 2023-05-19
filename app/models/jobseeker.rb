class Jobseeker < ApplicationRecord
  has_and_belongs_to_many :skills#, join_table: "skills", foreign_key: "skill_id"
end
