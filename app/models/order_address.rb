class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city,
                :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code,   format: { with: /\d{3}-\d{4}/, message: 'is invalid.Input half-width number and hyphen' }
    validates :prefecture_id, format: { with:/[2-48]/, message: 'is not select.Select prefecture' }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid.Input full-width charaset' }
    validates :address
    validates :phone_number, format: { with: /\A\d{,11}\z/, message: 'is invalid.Input half-width number' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
