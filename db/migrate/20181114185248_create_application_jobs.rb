class CreateApplicationJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :application_jobs do |t|
      t.Integer :application_id
      t.Integer :job_id

      t.timestamps
    end
  end
end
