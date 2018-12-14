class CreateApplicantRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :applicant_ratings do |t|
      t.integer :applicant_id
      t.integer :rating_id

      t.timestamps
    end
  end
end
