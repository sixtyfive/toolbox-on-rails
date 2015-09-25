class Time
  def noon
    Time.utc(self.year, self.month, self.day, 12, 00) 
  end
    
  def week_of_year
    woy = self.strftime("%W").to_i
    woy = 52 if woy == 0
    return woy
  end 
    
  def day_of_year
    self.strftime('%j').to_i
  end 
    
  def day_of_week
    self.strftime('%w').to_i
  end

  alias_method :week, :week_of_year
  alias_method :yweek, :week_of_year
  alias_method :dow, :day_of_week
end
