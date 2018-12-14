class CreateApplicantJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :applicant_jobs do |t|
      t.integer :applicant_id
      t.integer :job_id

      t.timestamps
    end
  end
end
