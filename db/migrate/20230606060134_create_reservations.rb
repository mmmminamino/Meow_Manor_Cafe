class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      
      
      
      t.integer :customer_id                  
      t.datetime :date_and_time,              null: false
      t.integer :number_of_people,               null: false
      t.integer :status, default: 0,               null: false
      t.timestamps
    end
  end
end
