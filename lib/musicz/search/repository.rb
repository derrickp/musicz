# frozen_string_literal: true

require "json"
require "musicz/entities/error"

module Musicz
  module Search
    class Repository
      def initialize(request: default_request)
        @request = request
      end

      def by_id(_id_options)
        raise NotImplementedError, "subclass must implement"
      end

      private

      attr_reader :request

      def default_request
        Musicz::Request.build
      end

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

      def by_term_with_entity(term, endpoint, entity_class)
        query = {query: term}.merge(format_params)
        response = request.get(endpoint: endpoint, parameters: query)
        if response.success?
          entity_class.new(JSON.parse(response.body))
        else
          build_error(response)
        end
      end

      def by_query_with_entity(query_terms, endpoint, entity_class)
        parameters = {query: build_query_param(query_terms)}
          .merge(format_params)
        response = request.get(endpoint: endpoint, parameters: parameters)
        return build_error(response) unless response.success?

        entity_class.new(JSON.parse(response.body))
      end

      def format_params
        {
          fmt: "json"
        }
      end

      def inc_params(relations)
        return {} if relations.empty?

        {
          inc: relations.join("+")
        }
      end

      def build_query_param(query_terms)
        valid_terms = query_terms.to_h.to_a.reject { |terms|
          terms[0].to_s.empty?
        }

        query_items = valid_terms.map { |terms|
          "#{terms[0]}:#{terms[1]}"
        }
        query_items.join(" AND ")
      end

      def build_error(response)
        if response.code == 400 # JSON parseable
          parsed = JSON.parse(response.body)
          Musicz::Entities::Error.new(parsed)
        else
          Musicz::Entities::Error.new(
            help: "Unknown error",
            error: response.body
          )
        end
      end
    end
  end
end
