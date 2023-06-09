class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :reservations, dependent: :destroy
         has_one_attached :image
         
    def active_for_authentication?
      super && (self.is_deleted == false)
    end
    
       validates :last_name,  presence: true
       validates :first_name, presence: true
       validates :last_name_kana,  presence: true
       validates :first_name_kana, presence: true
       validates :telephone_number, presence: true
       validates :birthday, presence: true
end

