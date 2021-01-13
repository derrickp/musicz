# frozen_string_literal: true

require "musicz/entity"

module Musicz
  module Entities
    class LabelInfoReference < Entity
      attribute :label do
        attribute :id, Types::Strict::String
        attribute :name, Types::Strict::String
        attribute :sort_name, Types::Strict::String
        attribute? :label_code, Types::Strict::String.optional
        attribute? :disambiguation, Types::Strict::String.optional
      end
      attribute? :catalog_number, Types::Strict::String.optional
    end
  end
end
