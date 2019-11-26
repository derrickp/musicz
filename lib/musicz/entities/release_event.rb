# frozen_string_literal: true

require 'musicz/entity'
require 'musicz/entities/area'

module Musicz
  module Entities
    class ReleaseEvent < Entity
      attribute :date, Types::Strict::String
      attribute :area, Area
    end
  end
end
