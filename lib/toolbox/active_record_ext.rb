require 'active_record'

module ActiveRecord
  Errors.class_eval do
    def delete(key)
      @errors.delete(key.to_s)
    end
  end
end
