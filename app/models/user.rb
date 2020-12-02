class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options null: false do
    validates :nickname, format: { with: /\A[ぁ-ん一-龥]/, message:"は全角で入力してください。"}
    validates :email, unique: true
    validates :last_name,A[ぁ-ん一-龥],message:'全角文字を使用してください'
    validates :last_name_kana
    validates :first_name
    validates :first_name_kana
    validates :birthday
  end
end
