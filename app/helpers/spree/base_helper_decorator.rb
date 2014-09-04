module Spree
  module BaseHelper
    def display_price(product_or_variant)
      product_or_variant.price_in(current_currency).display_price.to_html
    end
    alias :display_original_price :display_price
  end
end
