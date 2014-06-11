# Deprecated

I have stopped to use this approch of colorize the loggers to work with other way to highlight my logs. Now I'm using a simple shell function that put some color to texts using the tail and sed functions. This solution is in my workstation github project.

# BetterLog

Let your text logs look better with some color.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'better_log', git: 'https://github.com/vnegrisolo/better_log.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install better_log

## Usage

- Change the `config/enviroments/development.log` (or any other enviroment):

```ruby
config.log_formatter = BetterLog::ColoredLoggerFormatter.new
```

- You can also call directly the colorize method

```ruby
class YourClass
  include TerminalColor
  def initialize
    puts colorize('my text', color: :cyan, bg_color: :black)
  end
end
```

Supported colors:

```ruby
:black, :red, :green, :yellow, :blue, :magenta, :cyan, :white
```

## Contributing

1. Fork it ( http://github.com/vnegrisolo/better_log/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
