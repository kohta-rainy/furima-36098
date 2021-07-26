class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase_records

  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :last_name, presence: true
    validates :first_name,      presence: true
    validates :last_name_kana,  presence: true
    validates :first_name_kana, presence: true
  end

  validates :birth_date, presence: true
  validates :password, :password_confirmation, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end
