require 'musicz/entity'

module Musicz
  module Search
    module Options
      class RecordingQueryTerms < Entity
        attribute? :artist, Types::Strict::String.optional
        attribute? :title, Types::Strict::String.optional
      end
    end
  end
end
