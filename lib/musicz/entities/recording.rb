# frozen_string_literal: true

require "musicz/entity"
require "musicz/entities/artist_credit"
require "musicz/entities/release_reference"

module Musicz
  module Entities
    class Recording < Entity
      attribute :id, Types::Strict::String
      attribute :title, Types::Strict::String
      attribute? :disambiguation, Types::Strict::String.optional
      attribute? :score, Types::Strict::Integer.optional
      attribute? :artist_credit, Types::Array.of(ArtistCredit)
      attribute? :length, Types::JSON::Decimal.optional
      attribute? :isrcs, Types::Array.of(Types::Strict::String)
        .default([].freeze)
      attribute? :releases, Types::Array.of(ReleaseReference)
    end
  end
end
