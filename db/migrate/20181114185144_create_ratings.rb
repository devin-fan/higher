class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.Integer :question_id
      t.Integer :score
      t.Integer :comparison_count

      t.timestamps
    end
  end
end
