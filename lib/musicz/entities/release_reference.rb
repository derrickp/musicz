# frozen_string_literal: true

require "musicz/entity"
require "musicz/entities/text_representation"
require "musicz/entities/release_event"
require "musicz/entities/release_group"

module Musicz
  module Entities
    class ReleaseReference < Entity
      attribute :id, Types::Strict::String
      attribute :title, Types::Strict::String
      attribute? :status, Types::Strict::String.optional
      attribute? :disambiguation, Types::Strict::String.optional
      attribute? :date, Types::Strict::String.optional
      attribute? :country, Types::Strict::String.optional
      attribute? :release_group, ReleaseGroup.optional
    end
  end
end
