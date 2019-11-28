# frozen_string_literal: true

require 'musicz/entity'
require 'musicz/entities/artist'

module Musicz
  module Entities
    class ArtistList < Entity
      attribute :created, Types::Strict::String
      attribute :count, Types::JSON::Decimal
      attribute :offset, Types::JSON::Decimal
      attribute :artists, Types::Array.of(Artist)
    end
  end
end
