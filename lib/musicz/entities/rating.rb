# frozen_string_literal: true

require "musicz/entity"

module Musicz
  module Entities
    class Rating < Entity
      attribute :votes_count, Types::Strict::Integer
      attribute :value, Types::JSON::Decimal
    end
  end
end
