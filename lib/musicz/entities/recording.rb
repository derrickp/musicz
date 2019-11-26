# frozen_string_literal: true

require 'musicz/entity'
require 'musicz/entities/artist_credit'

module Musicz
  module Entities
    class Recording < Entity
      attribute :id, Types::Strict::String
      attribute :title, Types::Strict::String
      attribute? :disambiguation, Types::Strict::String.optional
      attribute? :artist_credit, Types::Array.of(ArtistCredit)
      attribute? :length, Types::JSON::Decimal.optional
      attribute? :isrcs, Types::Array.of(Types::Strict::String)
    end
  end
end
