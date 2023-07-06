class Reservation < ApplicationRecord
    belongs_to :customer
    has_many :reservation_status
    
    enum payment_method: { credit_card: 0, cash: 1 }
    enum status: { vacancy: 0, reservation: 1, completed: 2, cancel: 3 }
    
    validates :number_of_people,  presence: true
    validates :date_and_time, presence: true
    validates :customer, presence: true
end
