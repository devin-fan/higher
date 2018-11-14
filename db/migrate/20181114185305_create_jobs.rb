class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.String :title
      t.String :description

      t.timestamps
    end
  end
end
