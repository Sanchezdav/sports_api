# frozen_string_literal: true

require 'ostruct'

module SportsApi
  class Object < OpenStruct
    def initialize(attributes)
      super(to_ostruct(transform_attributes(attributes)))
    end

    private

    def transform_attributes(attributes)
      case attributes
      when String
        { value: attributes }
      when Array
        attributes.each_with_index.to_h { |val, i| [i, val] }
      else
        attributes
      end
    end

    def to_ostruct(obj)
      case obj
      when Hash
        OpenStruct.new(obj.transform_values { |val| to_ostruct(val) })
      when Array
        obj.map { |o| to_ostruct(o) }
      else
        obj
      end
    end
  end
end
