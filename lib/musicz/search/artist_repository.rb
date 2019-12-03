# frozen_string_literal: true

require 'musicz/entities/artist_list'
require 'musicz/entities/artist'
require 'musicz/search/repository'

module Musicz
  module Search
    class ArtistRepository < Repository
      ENDPOINT = 'artist'

      # @param id_options [Musicz::Search::Options::IdSearch]
      def by_id(id_options)
        by_id_with_entity(id_options, ENDPOINT, Musicz::Entities::Artist)
      end

      # @param term [String] The general term to searh MusicBrainz for
      # This gets executed on the MusicBrainz server by querying
      # the artist, sortname and alias fields
      def by_term(term)
        by_term_with_entity(term, ENDPOINT, Musicz::Entities::ArtistList)
      end

      # @param query_terms [Musicz::Search::Options::ArtistQueryTerms]
      # This executes a generic query against the MusicBrainz API
      # No support for paging, so use decently specific queries
      def by_query(query_terms)
        by_query_with_entity(
          query_terms,
          ENDPOINT,
          Musicz::Entities::ArtistList
        )
      end
    end
  end
end
