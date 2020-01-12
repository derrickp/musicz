# frozen_string_literal: true

require 'musicz/entity'
require 'musicz/entities/recording'

module Musicz
  module Entities
    class RecordingList < Entity
      attribute :created, Types::Strict::String
      attribute :count, Types::JSON::Decimal
      attribute :offset, Types::JSON::Decimal
      attribute :recordings, Types::Array.of(Recording)
    end
  end
end
