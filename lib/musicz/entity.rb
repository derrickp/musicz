# frozen_string_literal: true

require "dry-struct"
require "musicz/types"

module Musicz
  class Entity < Dry::Struct
    transform_keys do |key|
      key.to_s.tr("-", "_").to_sym
    end

    transform_types do |type|
      if type.default?
        type.constructor do |value|
          value.nil? ? Dry::Types::Undefined : value
        end
      else
        type
      end
    end
  end
end
