Hash.class_eval do
  def flatten(input = nil, prefix = nil)
    input = (input || self)
    output = {}
    input.each do |key,value|
      if value.class == Hash
        output = output.merge(flatten(value, key))
      else
        output["#{prefix ? prefix.to_s+'_' : nil}#{key}"] = value
      end
    end
    return output
  end
end
