# frozen_string_literal: true

require 'musicz/entity'
require 'musicz/entities/alias'
require 'musicz/entities/life_span'
require 'musicz/entities/rating'
require 'musicz/entities/tag'
require 'musicz/entities/release_reference'

module Musicz
  module Entities
    class Artist < Entity
      attribute :id, Types::Strict::String
      attribute :name, Types::Strict::String
      attribute :sort_name, Types::Strict::String
      attribute? :score, Types::Strict::Integer.optional
      attribute? :country, Types::Strict::String.optional
      attribute? :disambiguation, Types::Strict::String.optional
      attribute :type, Types::Strict::String
      attribute? :life_span, LifeSpan.optional
      attribute :aliases, Types::Strict::Array.of(Alias).default([].freeze)
      attribute :tags, Types::Strict::Array.of(Tag).default([].freeze)
      attribute? :rating, Rating.optional
      attribute? :releases, Types::Array.of(ReleaseReference)
    end
  end
end
