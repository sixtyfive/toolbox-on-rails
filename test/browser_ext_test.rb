require 'test_helper'
require 'browser'

FIREFOX_40_LINUX='Mozilla/5.0 (X11; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0'
SAFARI_8_0_MACOSX='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/600.8.9 (KHTML, like Gecko) Version/8.0.8 Safari/600.8.9'
SAFARI_8_0_IOS='Mozilla/5.0 (iPad; CPU OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H321 Safari/600.1.4'

class BrowserExtTest < ActiveSupport::TestCase
  def test_to_determine_a_getusermedia_capable_browser
    browser = Browser.new(ua: FIREFOX_40_LINUX, accept_language: 'de-de')
    assert_includes browser.audio_recording_capabilities, :getusermedia
  end
  
  def test_to_determine_an_only_wami_capable_browser
    browser = Browser.new(ua: SAFARI_8_0_MACOSX, accept_language: 'de-de')
    assert_includes browser.audio_recording_capabilities, :wami
    assert_not_includes browser.audio_recording_capabilities, :getusermedia
  end
  
  def test_to_determine_a_neither_getusermedia_nor_wami_capable_browser
    browser = Browser.new(ua: SAFARI_8_0_IOS, accept_language: 'de-de')
    assert_equal true, (browser.mobile? || browser.tablet?)
    assert_includes browser.audio_recording_capabilities, :fileupload
    assert_not_includes browser.audio_recording_capabilities, :getusermedia
    assert_not_includes browser.audio_recording_capabilities, :wami
  end
end
