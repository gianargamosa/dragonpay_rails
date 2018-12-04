# Dragonpay API Integration

Dragonpay provides an alternative channel for purchasing goods or services from the Internet. This was used for production transaction of some internal projects in my current company.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dragonpay_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dragonpay_rails

## Usage

```ruby
# config/initializers/dragonpay_payment.rb

DragonpayRails.configure do |config|
  config.merchant_id = 'your_merchant_id'
  config.secret_key = 'your_secret_key'
end
```

## Usage

```ruby
  @payment = DragonpayRails::Merchant.new(
    amount: '1500.00',
    ccy: 'PHP',
    description: 'Example Payment',
    email: 'examplepayment@payment.com'
  )
  
  @payment.pay
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dragonpay_rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DragonpayRails project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/dragonpay_rails/blob/master/CODE_OF_CONDUCT.md).
