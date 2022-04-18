module Validation

  def validate(attribute, **options)
    @@attribute = attribute
    @@options = options
  end

  def validate!
    if @@options.include?(:presence)
      if @@options[:presence] == true
        if @@attribute.nil? || @@attribute.empty?
          raise ArgumentError.new 'Attribute should be present!'
        end
      end
    end
    if @@options.include?(:format)
      unless @@attribute.match(@@options[:format])
        raise ArgumentError.new 'Attribute should match the passed regular expression!'
      end
    end
    if @@options.include?(:type)
      unless @@attribute.instance_of?(@@options[:type])
        raise ArgumentError.new 'Attribute should be an instance of the passed class!'
      end
    end
  end

  def valid?
    begin
      validate!
    rescue
      return false
    end
    return true
  end

end
