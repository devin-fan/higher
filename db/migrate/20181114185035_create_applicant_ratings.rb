class CreateApplicantRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :applicant_ratings do |t|
      t.Integer :applicant_id
      t.Integer :rating_id

      t.timestamps
    end
  end
end
