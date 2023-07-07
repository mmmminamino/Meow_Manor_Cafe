class Cat < ApplicationRecord
    has_one_attached :image
    
    
    enum genders: { male: 0, female: 1 }
end
