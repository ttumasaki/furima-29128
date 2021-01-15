class OrderAddress
  include ActiveModel::Model
  attr_accessor :card_number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture_id, :city,
                :address, :building_name, :phone_number

  with_option presence: true do
    validates :card_number,   format: { with: /\A\d\z/, message: "is invalid.Input half-width number"}
    validates :exp_month,     format: { with: /\A\d\z/, message: "is invalid.Input half-width number"}
    validates :exp_year,      format: { with: /\A\d\z/, message: "is invalid.Input half-width number"}
    validates :cvc,           format: { with: /\A\d\z/, message: "is invalid.Input half-width number"}
    validates :prefecture_id
    validates :city,          format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid.Input full-width charaset"}
    validates :address
    validates :phone_number,  format: { with: /\A\d{,11}\z/, message: "is invalid.Input half-width number"}
  end
  
  def save
    order = Order.create(user)
  end

end
