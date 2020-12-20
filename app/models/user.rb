class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6 },
                        confirmation: true,
                        format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :password_confirmation
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力してください。' }
    validates :last_name_kana, format: { with: /\A[ァ-ン]/, message: '全角カタカナのみで入力して下さい' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力してください。' }
    validates :first_name_kana, format: { with: /\A[ァ-ン]/, message: '全角カタカナのみで入力して下さい' }
    validates :birthday
  end

  has_many :items
  has_many :orders
end