# BetterLog

Let your text logs look better

## Installation

Add this line to your application's Gemfile:

    gem 'better_log', git: 'https://github.com/vnegrisolo/better_log.git'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install better_log

## Usage

change the `config/enviroments/development.log` (or other enviroment):
  config.log_formatter = BetterLog::ColoredLoggerFormatter.new

## Contributing

1. Fork it ( http://github.com/vnegrisolo/better_log/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
