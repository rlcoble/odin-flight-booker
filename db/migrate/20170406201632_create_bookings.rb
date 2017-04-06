class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :flight_id, foreign_key: true
      t.integer :passengers

      t.timestamps
    end
  end
end
