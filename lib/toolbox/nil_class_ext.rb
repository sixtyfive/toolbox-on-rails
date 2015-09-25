NilClass.class_eval do
  def html_safe
    String.new
  end
end
