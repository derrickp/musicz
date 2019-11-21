# frozen_string_literal: true

require 'json'
require 'musicz/entities/error'

module Musicz
  module Search
    class Repository
      def initialize(request:)
        @request = request
      end

      def by_id(_id_options)
        raise NotImplementedError, 'subclass must implement'
      end

      private

      attr_reader :request

      def by_id_with_entity(id_options, endpoint, entity_class)
        endpoint = "#{endpoint}/#{id_options.id}"
        parameters = inc_params(id_options.relationships).merge(format_params)
        response = request.get(endpoint: endpoint, parameters: parameters)
        if response.success?
          entity_class.new(JSON.parse(response.body))
        else
          build_error(response)
        end
      end

      def format_params
        {
          fmt: 'json'
        }
      end

      def inc_params(relations)
        return {} if relations.empty?

        {
          inc: relations.join('+')
        }
      end

      def build_error(response)
        if response.code == 400 # JSON parseable
          parsed = JSON.parse(response.body)
          Musicz::Entities::Error.new(parsed)
        else
          Musicz::Entities::Error.new(
            help: 'Unknown error',
            error: response.body
          )
        end
      end
    end
  end
end
