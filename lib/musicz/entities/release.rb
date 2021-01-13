# frozen_string_literal: true

require "musicz/entity"
require "musicz/entities/text_representation"
require "musicz/entities/artist_credit"
require "musicz/entities/label_info_reference"
require "musicz/entities/media"

module Musicz
  module Entities
    class Release < Entity
      attribute :id, Types::Strict::String
      attribute :title, Types::Strict::String
      attribute? :date, Types::Strict::String.optional
      attribute? :text_representation, TextRepresentation.optional
      attribute? :country, Types::Strict::String.optional
      attribute? :status, Types::Strict::String.optional
      attribute? :quality, Types::Strict::String.optional
      attribute? :packaging, Types::Strict::String.optional
      attribute? :barcode, Types::Strict::String.optional
      attribute? :status_id, Types::Strict::String.optional
      attribute? :artist_credit, Types::Array.of(ArtistCredit)
      attribute? :label_info, Types::Array.of(LabelInfoReference)
      attribute? :asin, Types::Strict::String.optional
      attribute? :disambiguation, Types::Strict::String.optional
      attribute? :media, Media.optional

      attribute? :release_group do
        attribute :id, Types::Strict::String
        attribute :primary_type, Types::Strict::String
      end

      attribute :release_events, Types::Array.of(ReleaseEvent)
        .default([].freeze)
    end
  end
end
