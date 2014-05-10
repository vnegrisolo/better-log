require 'better_log/version'
require 'active_support/core_ext'

module BetterLog
  extend ActiveSupport::Autoload

  autoload :TerminalColor
  autoload :ColoredLoggerFormatter
end
