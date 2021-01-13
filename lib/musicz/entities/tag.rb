# frozen_string_literal: true

require "musicz/entity"

module Musicz
  module Entities
    class Tag < Entity
      attribute :count, Types::Strict::Integer
      attribute :name, Types::Strict::String
    end
  end
end
