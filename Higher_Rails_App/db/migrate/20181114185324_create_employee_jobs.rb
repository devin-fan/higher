class CreateEmployeeJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_jobs do |t|
      t.integer :employee_id
      t.integer :job_id

      t.timestamps
    end
  end
end
