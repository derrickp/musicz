# frozen_string_literal: true

require 'musicz/search/repository'
require 'musicz/entities/area'

module Musicz
  module Search
    class AreaRepository < Repository
      ENDPOINT = 'area'

      def by_id(id_options)
        by_id_with_entity(id_options, ENDPOINT, Musicz::Entities::Area)
      end
    end
  end
end
