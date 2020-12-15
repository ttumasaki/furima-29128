class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, inclusion: { in: %w(@)}
  validates :password, presence: true, length: { minimum: 6 },confirmation: true
  validates :password_confirmation, presence: true

  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください。"}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ン]/,message: "全角カタカナのみで入力して下さい"}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください。"}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン]/,message: "全角カタカナのみで入力して下さい"}
  validates :birthday, presence: true

  has_many :items
  has_many :orders

end