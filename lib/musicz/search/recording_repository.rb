# frozen_string_literal: true

require "musicz/entities/recording"
require "musicz/entities/recording_list"
require "musicz/search/repository"

module Musicz
  module Search
    class RecordingRepository < Repository
      ENDPOINT = "recording"

      # @param id_options [Musicz::Search::Options::IdSearch]
      def by_id(id_options)
        by_id_with_entity(id_options, ENDPOINT, Musicz::Entities::Recording)
      end

      # @param term [String] The general term to searh MusicBrainz for
      # This gets executed on the MusicBrainz server by querying
      # the recording, sortname and alias fields
      def by_term(term)
        by_term_with_entity(term, ENDPOINT, Musicz::Entities::RecordingList)
      end

      # @param query_terms [Musicz::Search::Options::RecordingQueryTerms]
      # This executes a generic query against the MusicBrainz API
      # No support for paging, so use decently specific queries
      def by_query(query_terms)
        by_query_with_entity(
          query_terms,
          ENDPOINT,
          Musicz::Entities::RecordingList
        )
      end
    end
  end
end
