class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.String :question
      t.String :description

      t.timestamps
    end
  end
end
