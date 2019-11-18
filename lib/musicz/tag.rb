require 'musicz/entity'

module Musicz
  class Tag < Entity
    attribute :count, Types::Strict::Integer
    attribute :name, Types::Strict::String
  end
end
