class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :title, :text, :category, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
  end
end
