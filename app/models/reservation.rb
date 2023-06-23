class Reservation < ApplicationRecord
    enum payment_methods: { credit_card: 0, cash: 1 }
    enum status: { vacancy: 0, reservation: 1, completed: 2, cancel: 3 }
end
