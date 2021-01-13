# frozen_string_literal: true

module Musicz
  class Configuration
    class NoConfigBlockGiven < RuntimeError; end
    class InvalidConfiguration < RuntimeError; end

    DEFAULT_BASE_URI = "https://musicbrainz.org/ws/2"
    attr_accessor :base_uri, :app_name, :contact

    def initialize(base_uri: DEFAULT_BASE_URI)
      @base_uri = base_uri
    end

    def valid?
      errors.empty?
    end

    def errors
      [].tap do |arr|
        arr << "No base_uri" if base_uri.nil?
        arr << "No app_name" if app_name.nil?
        arr << "No contact" if contact.nil?
      end
    end

    def self.build_default
      new.tap do |c|
        c.app_name = "Musicz"
        c.contact = "https://github.com/derrickp/musicz"
      end
    end
  end

  def self.clear
    @config = nil
  end

  def self.config
    @config
  end

  def self.config=(value)
    unless value.is_a?(Configuration)
      raise ArgumentError, "value is not a Configuration object"
    end

    raise ArgumentError, "invalid Configuration value" unless value.valid?

    @config = value
  end

  def self.configure
    raise Configuration::NoConfigBlockGiven unless block_given?

    yield @config ||= Configuration.new
    return if @config.valid?

    raise Configuration::InvalidConfiguration, @config.errors
  end
end
