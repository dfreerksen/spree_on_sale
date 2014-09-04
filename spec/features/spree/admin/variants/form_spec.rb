require 'spec_helper'

feature 'Product with variations' do
  stub_authorization!

  context 'On Sale form fields' do
    context 'not available on product' do
      xscenario 'when product has variations' do
      end
    end

    context 'available on product' do
      xscenario 'when product does not have variations' do
      end
    end
  end
end
