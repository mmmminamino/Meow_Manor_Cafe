class Reservation < ApplicationRecord
    belongs_to :customer
    has_many :reservation_status
    
    enum payment_methods: { クレジットカード: 0, 当日に現金でお支払い: 1 }
    enum status: { vacancy: 0, reservation: 1, completed: 2, cancel: 3 }
end
