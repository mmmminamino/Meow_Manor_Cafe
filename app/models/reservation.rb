class Reservation < ApplicationRecord
    belongs_to :customer
    has_many :reservation_status
    
    enum status: { ご予約中: 0, 訪問済み: 1, キャンセル: 2}
    
    validates :number_of_people,  presence: true
    validates :date_and_time, presence: true
    validates :customer, presence: true
end
