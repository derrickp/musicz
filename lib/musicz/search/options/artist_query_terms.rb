# frozen_string_literal: true

require "musicz/entity"

module Musicz
  module Search
    module Options
      # Setting any of these and passing into the repo terms query will
      # include them in the query to the endpoint
      class ArtistQueryTerms < Entity
        attribute? :alias, Types::Strict::String.optional
        attribute? :area, Types::Strict::String.optional
        attribute? :artist, Types::Strict::String.optional
        attribute? :artistaccent, Types::Strict::String.optional
        attribute? :begin, Types::Strict::String.optional
        attribute? :beginarea, Types::Strict::String.optional
        attribute? :comment, Types::Strict::String.optional
        attribute? :country, Types::Strict::String.optional
        attribute? :end, Types::Strict::String.optional
        attribute? :endarea, Types::Strict::String.optional
        attribute? :gender, Types::Strict::String.optional
        attribute? :ipi, Types::Strict::String.optional
        attribute? :sortname, Types::Strict::String.optional
        attribute? :tag, Types::Strict::String.optional
        attribute? :type, Types::Strict::String.optional
      end
    end
  end
end
