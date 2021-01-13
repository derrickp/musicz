# frozen_string_literal: true

require "musicz/entity"

module Musicz
  module Entities
    class RecordingReference < Entity
      attribute :id, Types::Strict::String
      attribute :title, Types::Strict::String
      attribute? :disambiguation, Types::Strict::String.optional
    end
  end
end
