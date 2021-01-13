# frozen_string_literal: true

require "musicz/entity"

module Musicz
  module Entities
    class ArtistReference < Entity
      attribute :id, Types::Strict::String
      attribute :name, Types::Strict::String
      attribute? :sort_name, Types::Strict::String.optional
      attribute? :disambiguation, Types::Strict::String.optional
    end
  end
end
