require 'dry-struct'
require 'musicz/types'

module Musicz
  class Entity < Dry::Struct
    transform_keys do |key|
      key.to_s.gsub('-', '_').to_sym
    end
  end
end
