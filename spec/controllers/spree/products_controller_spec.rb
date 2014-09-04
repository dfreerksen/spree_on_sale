require 'spec_helper'

describe Spree::ProductsController do
  let(:sale_path) { spree.products_sale_path }

  context '#sale' do
    xit "loads `sale` template" do
      spree_get :sale_path
      expect(response).to render_template(:sale)
    end
  end
end
