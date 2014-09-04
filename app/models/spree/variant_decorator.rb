Spree::Variant.class_eval do

  has_one :sale_price,
    -> { where currency: Spree::Config[:currency] },
    class_name: 'Spree::SalePrice',
    dependent: :destroy

  #delegate_belongs_to :default_price, :display_price, :display_amount, :price, :price=, :currency

  has_many :sale_prices,
    class_name: 'Spree::SalePrice',
    dependent: :destroy,
    inverse_of: :variant
end
