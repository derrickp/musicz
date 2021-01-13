# frozen_string_literal: true

require "musicz/entity"
require "musicz/entities/area_reference"

module Musicz
  module Entities
    class AreaRelation < Entity
      attribute? :attribute_ids, Types::Strict::Hash.optional
      attribute :direction, Types::Strict::String
      attribute :type_id, Types::Strict::String
      attribute :ended, Types::Strict::Bool.default(false)
      attribute? :end, Types::Strict::String.optional
      attribute :area, AreaReference
    end
  end
end
