Date.class_eval do
  def day_of_year
    self.strftime('%j').to_i
  end

  def day_of_week
    self.strftime('%w').to_i
  end

  alias_method :dow, :day_of_week
end
