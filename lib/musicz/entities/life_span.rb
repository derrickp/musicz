# frozen_string_literal: true

require 'musicz/entity'

module Musicz
  module Entities
    class LifeSpan < Entity
      attribute :ended, Types::Strict::Bool
      attribute? :begin, Types::Strict::String.optional
      attribute? :end, Types::Strict::String.optional
    end
  end
end
