# frozen_string_literal: true

require 'musicz/entity'

module Musicz
  module Entities
    class Area < Entity
      attribute :id, Types::Strict::String
      attribute :name, Types::Strict::String
      attribute :sort_name, Types::Strict::String
      attribute :iso_3166_1_codes, Types::Array.of(Types::Strict::String).
        default([].freeze)
      attribute? :disambiguation, Types::Strict::String.optional
    end
  end
end
