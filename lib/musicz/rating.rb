require 'musicz/entity'

module Musicz
  class Rating < Entity
    attribute :votes_count, Types::Strict::Integer
    attribute :value, Types::JSON::Decimal
  end
end
