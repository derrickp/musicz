# frozen_string_literal: true

require 'musicz/entity'

module Musicz
  module Entities
    class TextRepresentation < Entity
      attribute :language, Types::Strict::String
      attribute :script, Types::Strict::String
    end
  end
end
