class ReservationStatus < ApplicationRecord
    belongs_to :reservation
    
    enum reserve_status: { "予約中": 0, "訪問済み": 1, "キャンセル": 2 }
end
