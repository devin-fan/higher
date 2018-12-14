class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest
      t.boolean :admin
      t.binary :picture

      t.timestamps
    end
  end
end
