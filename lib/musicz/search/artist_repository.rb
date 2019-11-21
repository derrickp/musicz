# frozen_string_literal: true

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
    end
  end
end
