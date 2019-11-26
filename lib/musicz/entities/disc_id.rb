# frozen_string_literal: true

require 'musicz/entity'

module Musicz
  module Entities
    class DiscId < Entity
      attribute :id, Types::Strict::String
      attribute :sectors, Types::Strict::Integer
    end
  end
end
