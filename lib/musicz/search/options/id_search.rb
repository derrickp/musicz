# frozen_string_literal: true

require 'musicz/entity'

module Musicz
  module Search
    module Options
      class IdSearch < Entity
        attribute :id, Types::Strict::String
        attribute :relationships, Types::Array.of(Types::Strict::String).
          default([].freeze)
      end
    end
  end
end
