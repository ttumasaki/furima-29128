class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day_required

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, numericality: { greater_than: 299,
                                      less_than: 10_000_000 },
                      format: { with: /\d/ }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :fee_burden_id
      validates :prefecture_id
      validates :day_required_id
    end
  end
end
