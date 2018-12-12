class Job < ApplicationRecord
  has_many :applicant_jobs
  has_many :applicants, through: :applicant_jobs

  has_many :employee_jobs
  has_many :employees, through: :employee_jobs
end
