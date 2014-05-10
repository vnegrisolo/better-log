require 'spec_helper'

describe BetterLog::ColoredLoggerFormatter do

  let(:timestamp) { Time.new }
  let(:formatted_time) { timestamp.strftime("%Y-%m-%d %H:%M:%S.") << timestamp.usec.to_s[0..2].rjust(3) }

  describe '.format_time' do
    it 'format time to log message' do
      expect( described_class.new.format_time(timestamp) ).to eq(formatted_time)
    end
  end

  describe '.call' do
    it 'return nil on nil message' do
      expect( described_class.new.call('DEBUG', timestamp, nil, nil) ).to be nil
    end
    it 'return nil on empty message' do
      expect( described_class.new.call('DEBUG', timestamp, nil, '') ).to be nil
    end

    subject { described_class.new.call(severity, timestamp, nil, 'log text') }
    let(:expected) { "[#{formatted_time}] \e[#{color}m#{sprintf("[%-5s]",severity)}\e[0m [pid:#{$$}] log text\n" }

    context 'when debug occurs' do
      let(:severity) { 'DEBUG' }
      let(:color) { '36;40' }
      it 'log in debug mode' do
        expect( subject ).to eq(expected)
      end
    end
    context 'info' do
      let(:severity) { 'INFO' }
      let(:color) { '32;40' }
      it 'log in info mode' do
        expect( subject ).to eq(expected)
      end
    end
    context 'warn' do
      let(:severity) { 'WARN' }
      let(:color) { '33;40' }
      it 'log in warn mode' do
        expect( subject ).to eq(expected)
      end
    end
    context 'error' do
      let(:severity) { 'ERROR' }
      let(:color) { '31;40' }
      it 'log in error mode' do
        expect( subject ).to eq(expected)
      end
    end
    context 'fatal' do
      let(:severity) { 'FATAL' }
      let(:color) { '30;41' }
      it 'log in fatal mode' do
        expect( subject ).to eq(expected)
      end
    end
    context 'unknow' do
      let(:severity) { 'UNKNOW' }
      let(:color) { '30;43' }
      it 'log in unknow mode' do
        expect( subject ).to eq(expected)
      end
    end
    context 'other' do
      let(:severity) { 'other' }
      let(:color) { '30;43' }
      it 'log in other mode' do
        expect( subject ).to eq(expected)
      end
    end
  end
end
