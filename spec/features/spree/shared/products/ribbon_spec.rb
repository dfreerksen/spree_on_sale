require 'spec_helper'

feature 'Ribbon' do
  context 'Product not on sale' do
    xscenario 'does not show `on sale` ribbon' do
    end
  end

  context 'Product on sale' do
    xscenario 'shows `on sale` ribbon' do
    end
  end
end
