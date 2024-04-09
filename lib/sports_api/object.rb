# frozen_string_literal: true

require 'ostruct'

module SportsApi
  class Object
    def initialize(attributes)
      attrs = attributes.is_a?(String) ? { value: attributes } : attributes
      @attributes = OpenStruct.new(attrs)
    end

    def method_missing(method, *args, &)
      attribute = @attributes.send(method, *args, &)
      attribute.is_a?(Hash) ? self.class.new(attribute) : attribute
    end

    def respond_to_missing?(method, include_private = false)
      true
    end
  end
end
