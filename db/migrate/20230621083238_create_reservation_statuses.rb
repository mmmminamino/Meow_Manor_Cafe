class CreateReservationStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_statuses do |t|
      
      t.integer :reservation_id
      t.integer :reserve_status,default: 0,null: false
      t.timestamps
    end
  end
end
