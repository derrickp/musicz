# frozen_string_literal: true

require 'musicz/entity'
require 'musicz/entities/recording_reference'
require 'musicz/entities/artist_credit'

module Musicz
  module Entities
    class Track < Entity
      attribute :number, Types::Strict::String
      attribute :length, Types::Strict::Integer
      attribute :title, Types::Strict::String
      attribute :recording, RecordingReference
      attribute :artist_credit, ArtistCredit
    end
  end
end
