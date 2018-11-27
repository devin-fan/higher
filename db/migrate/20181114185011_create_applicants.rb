class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :last_name
      t.binary :resume
      t.string :gpa
      t.string :education_info
      t.string :application_info

      t.timestamps
    end
  end
end
