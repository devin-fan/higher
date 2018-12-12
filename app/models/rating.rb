class Rating < ApplicationRecord
  belongs_to :applicant
  belongs_to :question
end
