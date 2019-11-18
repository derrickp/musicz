require 'musicz/entity'
require 'musicz/alias'
require 'musicz/life_span'
require 'musicz/rating'
require 'musicz/tag'

module Musicz
  class Artist < Entity
    attribute :id, Types::Strict::String
    attribute :name, Types::Strict::String
    attribute :sort_name, Types::Strict::String
    attribute? :country, Types::Strict::String.optional
    attribute? :disambiguation, Types::Strict::String.optional
    attribute :type, Types::Strict::String
    attribute? :life_span, LifeSpan.optional
    attribute :aliases, Types::Strict::Array.of(Alias).default([].freeze)
    attribute :tags, Types::Strict::Array.of(Tag).default([].freeze)
    attribute? :rating, Rating.optional
  end
end
