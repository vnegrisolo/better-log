require 'spec_helper'

describe BetterLog::TerminalColor do
  describe '#colorize' do

    subject do
      class MyClass
        include BetterLog::TerminalColor
      end.new
    end

    it 'default white text on black background' do
      expect( subject.colorize('pretty text') ).to eq("\e[37;40mpretty text\e[0m")
    end
    it 'explicit white text on black background' do
      expect( subject.colorize('pretty text', color: :white, bg_color: :black) ).to eq("\e[37;40mpretty text\e[0m")
    end
    it 'red text on green background' do
      expect( subject.colorize('pretty text', color: :red, bg_color: :green) ).to eq("\e[31;42mpretty text\e[0m")
    end
    it 'cyan text on magenta background' do
      expect( subject.colorize('pretty text', color: :cyan, bg_color: :magenta) ).to eq("\e[36;45mpretty text\e[0m")
    end
    it 'yellow text on blue background' do
      expect( subject.colorize('pretty text', color: :yellow, bg_color: :blue) ).to eq("\e[33;44mpretty text\e[0m")
    end
  end
end
