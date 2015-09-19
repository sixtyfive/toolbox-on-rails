require 'browser'

Browser.class_eval do
  self.modern_rules.clear
  self.modern_rules.tap do |rules|
    rules << -> b {b.edge?    && b.version.to_i >= 12}
    rules << -> b {b.firefox? && b.version.to_i >= 38}
    rules << -> b {b.chrome?  && b.version.to_i >= 31}
    rules << -> b {b.opera?   && b.version.to_i >= 31}
    rules << -> b {b.android? && b.version.to_i >= 44}
  end

  def audio_recording_capabilities
    capabilities = [:getusermedia, :wami, :fileupload]
    capabilities.delete :getusermedia unless modern?
    capabilities.delete :wami unless flash_enabled?
    capabilities
  end
  
  private
  
  def flash_enabled?
    # TODO: How to a̲c̲t̲u̲a̲l̲l̲y̲ implement this?
    !(mobile? || tablet?) # Rationale: it doesn't work properly on mobile devices anyways, so it's much better to drop back to files uploads.
                          # Source: http://www.articlesbase.com/online-education-articles/do-we-need-html5-audio-recording-6500536.html
  end
end
