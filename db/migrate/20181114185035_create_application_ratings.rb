class CreateApplicationRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :application_ratings do |t|
      t.Integer :application_id
      t.Integer :rating_id

      t.timestamps
    end
  end
end
