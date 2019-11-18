require 'musicz/entity'

module Musicz
  class Alias < Entity
    attribute :name, Types::Strict::String
    attribute :sort_name, Types::Strict::String
    attribute? :locale, Types::Strict::String.optional
    attribute? :primary, Types::Strict::Bool
  end
end
