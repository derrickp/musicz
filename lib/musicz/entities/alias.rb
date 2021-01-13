# frozen_string_literal: true

require "musicz/entity"

module Musicz
  module Entities
    class Alias < Entity
      attribute :name, Types::Strict::String
      attribute :sort_name, Types::Strict::String
      attribute? :locale, Types::Strict::String.optional
      attribute :primary, Types::Strict::Bool.default(false)
    end
  end
end
