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
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力してください。' } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ン]/, message: '全角カタカナのみで入力して下さい' } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
  
  has_many :items
  # has_many :orders
end
