require 'spec_helper'
require 'musicz/configuration'

RSpec.describe Musicz::Configuration do
  describe '.configure' do
    after(:each) do
      Musicz.clear
    end

    it 'yields a configuration object and does not raise' do
      called = false
      Musicz.configure do |config|
        called = true
        expect(subject).to be_a(Musicz::Configuration)
        config.app_name = 'test'
        config.contact = 'test'
      end

      expect(called).to eq(true)
    end

    context 'when given no block' do
      it 'raises an exception' do
        expect { Musicz.configure }.to raise_error(Musicz::Configuration::NoConfigBlockGiven)
      end
    end

    context 'when values are not filled out' do
      it 'raises error' do
        expect { Musicz.configure {} }.to raise_error(Musicz::Configuration::InvalidConfiguration)
      end
    end
  end

  describe '#valid?' do
    subject { config.valid? }

    let(:config) { described_class.new }

    it { is_expected.to eq(false) }

    context 'with values filled out' do
      let(:config) do
        described_class.new.tap do |config|
          config.app_name = 'test'
          config.contact = 'test'
        end
      end

      it { is_expected.to eq(true) }
    end
  end

  describe '#errors' do
    subject { config.errors }

    let(:config) do
      described_class.new.tap do |config|
        config.base_uri = nil
      end
    end

    it { is_expected.to contain_exactly('No base_uri', 'No contact', 'No app_name') }

    context 'given valid values' do
      let(:config) do
        described_class.new.tap do |config|
          config.app_name = 'test'
          config.contact = 'test'
        end
      end

      it { is_expected.to eq([]) }
    end
  end
end
