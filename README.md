# Spree On Sale

Add a sale price to products and/or variants without changing the price of the product. A start and end date can be applied to sale prices as well.

> NOTE: This is still in development. Not ready for production


## Installation

Add this line to your Spree application's Gemfile:

    gem 'spree_on_sale', github: 'groundctrl/spree_on_sale'

Run the bundle command to install it:

    bundle install

After installing, you'll need to run the generator:

    bundle exec rails g spree_on_sale:install


## TODO
- Admin
  - Do not display sale price fields when creating products
  - Form fields for product without variations
  - Form fields for product with variations
  - Validate that `amount` is not greater current price
  - Validate that `amount` is greater than $0.00
- Frontend
  - /products/sale to list products that are currently on sale
  - display_price() override
  - `On Sale` ribbon on products that are on sale
  - CSS
    - Ribbon
    - Strike original price (override)
    - Red sale price (override)


## Testing

Generate a dummy application

    bundle exec rake test_app

Running tests

    bundle exec rake spec


## Contributing

1. Fork it ( https://github.com/groundctrl/spree_on_sale/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
