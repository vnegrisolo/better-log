module BetterLog
  module TerminalColor

    COLORS = {
      black: 0,
      red: 1,
      green: 2,
      yellow: 3,
      blue: 4,
      magenta: 5,
      cyan: 6,
      white: 7
    }.freeze

    # put some color to text
    # params
    #   text - the text to be colored
    #   options[:color] - the text color
    #   options[:bg_color] - the background color
    # return - the text colorized
    def colorize(text, options = {})
      code = convert(options.fetch(:color, :white), options.fetch(:bg_color, :black))
      "#{begin_color(code)}#{text}#{end_color(code)}"
    end

    private

    def convert(text_color, background_color)
      codes = []
      codes << "3#{COLORS.fetch(text_color)}" if text_color
      codes << "4#{COLORS.fetch(background_color)}" if background_color
      codes.join(';')
    end

    def begin_color(code)
      code ? "\e[#{code}m" : ''
    end

    def end_color(code)
      code ? "\e[0m" : ''
    end
  end

end
