module Spree
  class SalePrice < ActiveRecord::Base
    acts_as_paranoid

    belongs_to :variant, class_name: 'Spree::Variant', inverse_of: :sale_prices, touch: true

    validate :check_price
    validates :amount, numericality: { greater_than: 0 }, allow_nil: true
    validate :validate_amount_maximum

    def display_sale_amount
      money
    end
    alias :display_sale_price :display_sale_amount

    def money
      Spree::Money.new(amount || 0, { currency: currency })
    end

    def price
      amount
    end

    def price=(price)
      self[:amount] = parse_price(price)
    end

    def variant
      Spree::Variant.unscoped { super }
    end

    private

    def check_price
      raise 'Price must belong to a variant' if variant.nil?

      if currency.nil?
        self.currency = Spree::Config[:currency]
      end
    end

    def parse_price(price)
      return price unless price.is_a?(String)

      separator, delimiter = I18n.t([:'number.currency.format.separator', :'number.currency.format.delimiter'])
      non_price_characters = /[^0-9\-#{separator}]/
      price.gsub!(non_price_characters, '') # strip everything else first
      price.gsub!(separator, '.') unless separator == '.' # then replace the locale-specific decimal separator with the standard separator if necessary

      price.to_d
    end

    def maximum_amount
      BigDecimal '999999.99'
    end

    def validate_amount_maximum
      if amount && amount > maximum_amount
        errors.add :amount, I18n.t('errors.messages.less_than', count: maximum_amount)
      end
    end
  end
end
