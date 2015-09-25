module Enumerable
  def first_not_nil_index
    each_with_index { |o, i| return i if o != nil }
    return nil
  end
end
