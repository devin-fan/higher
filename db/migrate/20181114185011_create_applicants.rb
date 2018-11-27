class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.String :first_name
      t.String :last_name
      t.binary :resume
      t.String :gpa
      t.String :education_info
      t.String :application_info

      t.timestamps
    end
  end
end
