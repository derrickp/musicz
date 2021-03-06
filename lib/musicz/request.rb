# frozen_string_literal: true

require "uri"
require "typhoeus"

module Musicz
  class Request
    def self.default_config
      Musicz.config
    end

    def self.build(config: default_config)
      new(config: config)
    end

    def initialize(config:)
      @config = config
    end

    def get(endpoint:, parameters:)
      url = "#{uri(endpoint)}?#{URI.encode_www_form(parameters)}"
      Typhoeus.get(url, headers: headers)
    end

    private

    def headers
      {
        "User-Agent" => "#{@config.app_name} #{@config.contact}"
      }
    end

    def uri(endpoint)
      "#{@config.base_uri}/#{endpoint}"
    end
  end
end
