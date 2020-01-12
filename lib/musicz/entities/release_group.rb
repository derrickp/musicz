# frozen_string_literal: true

require 'musicz/entity'

module Musicz
  module Entities
    class ReleaseGroup < Entity
      attribute :id, Types::Strict::String
      attribute :type_id, Types::Strict::String
      attribute? :title, Types::Strict::String.optional
      attribute? :primary_type, Types::Strict::String.optional
    end
  end
end
