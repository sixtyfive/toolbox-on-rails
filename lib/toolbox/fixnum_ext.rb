Fixnum.class_eval do
  def human_duration
    "#{("%2d" % self).gsub(' ', '').gsub('.', ',')} Std."
  end
end
