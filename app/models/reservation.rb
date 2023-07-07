class Reservation < ApplicationRecord
    belongs_to :customer
    has_many :reservation_status
    
    enum status: { ご予約可能: 0, ご予約中: 1, 訪問済み: 2, キャンセル: 3 }
    
    validates :number_of_people,  presence: true
    validates :date_and_time, presence: true
    validates :customer, presence: true
end
