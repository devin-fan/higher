class CreateEmployeeJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_jobs do |t|
      t.Integer :employee_id
      t.Integer :job_id

      t.timestamps
    end
  end
end
