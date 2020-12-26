class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  validates :title, :text, :category, presence: true
  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :fee_burden
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  validates :title, :text, :status, presence: true
  with_options numericality: { other_than: 1 } do
    validates :status_id
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :fee_burden
  validates :title, :text, :fee_burden, presence: true
  with_options numericality: { other_than: 1 } do
    validates :fee_burden_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  validates :title, :text, :prefecture, presence: true
  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :day_required
  validates :title, :text, :day_required, presence: true
  with_options numericality: { other_than: 1 } do
    validates :day_required_id
  end

end
