# frozen_string_literal: true

require "musicz/entity"
require "musicz/entities/artist_reference"

module Musicz
  module Entities
    class ArtistCredit < Entity
      attribute :name, Types::Strict::String
      attribute? :joinphrase, Types::Strict::String.optional
      attribute? :artist, ArtistReference
    end
  end
end
