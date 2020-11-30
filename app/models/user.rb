class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, null: false
  validates :email, null: false, unique: true
  validates :last_name,
  validates :last_name_kana,
  validates :first_name,
  validates :first_name_kana,
  validates :birthday
end
