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
    capabilities = [:getusermedia, :thirdparty, :fileupload]
    capabilities.delete :getusermedia unless modern?
    capabilities
  end
end
