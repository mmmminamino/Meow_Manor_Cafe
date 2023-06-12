class Reservation < ApplicationRecord
    enum payment_methods: { credit_card: 0, cash: 1 }
end
