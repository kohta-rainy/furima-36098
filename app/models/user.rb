class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase_records

  with_options presence: true do

   validates :nickname

   with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :last_name
    validates :first_name
   end

   with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
   end

   validates :birth_date
   validates :password, :password_confirmation, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  end
end

