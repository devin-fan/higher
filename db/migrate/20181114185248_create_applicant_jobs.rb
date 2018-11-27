class CreateApplicantJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :applicant_jobs do |t|
      t.Integer :applicant_id
      t.Integer :job_id

      t.timestamps
    end
  end
end
