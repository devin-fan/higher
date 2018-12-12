class Applicant < ApplicationRecord
  has_many :ratings
  has_many :applicant_jobs
  has_many :jobs, through: :applicant_jobs
end
