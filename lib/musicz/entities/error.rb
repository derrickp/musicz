# frozen_string_literal: true

require 'musicz/entity'

module Musicz
  module Entities
    class Error < Entity
      attribute :error, Types::Strict::String
      attribute? :help, Types::Strict::String.optional
    end
  end
end
