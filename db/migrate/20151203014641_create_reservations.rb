class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :price
      t.integer :total

      t.timestamps null: false
    end
  end
end
