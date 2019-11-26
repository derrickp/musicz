# frozen_string_literal: true

require 'musicz/entity'
require 'musicz/entities/disc_id'
require 'musicz/entities/track'

module Musicz
  module Entities
    class Media < Entity
      attribute :track_offset, Types::Strict::Integer
      attribute :track_count, Types::Strict::Integer
      attribute :title, Types::Strict::String
      attribute :format, Types::Strict::String
      attribute :discids, Types::Array.of(DiscId).default([].freeze)
      attribute :tracks, Types::Array.of(Track).default([].freeze)
    end
  end
end
