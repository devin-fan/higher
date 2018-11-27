class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :question_id
      t.integer :score
      t.integer :comparison_count

      t.timestamps
    end
  end
end
