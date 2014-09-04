class CreateSpreeSalePrices < ActiveRecord::Migration
  def change
    create_table :spree_sale_prices do |t|
      t.references :variant, null: false
      t.float :amount, default: nil, null: true
      t.string :currency, default: 'USD', null: false
      t.datetime :start_at, default: nil, null: true
      t.datetime :end_at, default: nil, null: true
      t.timestamps
    end

    add_index :spree_sale_prices, :variant_id
  end
end
