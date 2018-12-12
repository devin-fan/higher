class Employee < ApplicationRecord
  has_many :employee_jobs
  has_many :jobs, through: :employee_jobs
end
