module BetterLog
  class ColoredLoggerFormatter < ActiveSupport::Logger::SimpleFormatter
    include TerminalColor

    COLORS = {
      'DEBUG' => {text: :cyan, background: :black},
      'INFO' => {text: :green, background: :black},
      'WARN' => {text: :yellow, background: :black},
      'ERROR' => {text: :red, background: :black},
      'FATAL' => {text: :black, background: :red},
      'UNKNOWN' => {text: :black, background: :yellow}
    }.freeze

    def call(severity, timestamp, progname, msg)
      return unless msg.present?
      colors = colors(severity)
      colored_severity = colorize(sprintf("[%-5s]",severity), color: colors[:text], bg_color: colors[:background])
      "[#{format_time(timestamp)}] #{colored_severity} [pid:#{$$}] #{msg.strip}\n"
    end

    def format_time(timestamp)
      timestamp.strftime("%Y-%m-%d %H:%M:%S.") << timestamp.usec.to_s[0..2].rjust(3)
    end

    private

    def colors(severity)
      COLORS.fetch(severity, COLORS['UNKNOWN'])
    end
  end
end
