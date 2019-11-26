# frozen_string_literal: true

require 'musicz/entity'
require 'musicz/entities/text_representation'
require 'musicz/entities/release_event'

module Musicz
  module Entities
    class ReleaseReference < Entity
      attribute :id, Types::Strict::String
      attribute :title, Types::Strict::String
      attribute? :disambiguation, Types::Strict::String.optional
    end
  end
end
