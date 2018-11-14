class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.String :first_name
      t.String :last_name
      t.String :username
      t.String :password_digest
      t.boolean :admin
      t.binary :picture

      t.timestamps
    end
  end
end
