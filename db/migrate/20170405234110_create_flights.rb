class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.integer :start_id, foreign_key: true
      t.integer :finish_id, foreign_key: true
      t.datetime :start_datetime
      t.integer :flight_duration

      t.timestamps
    end
  end
end
