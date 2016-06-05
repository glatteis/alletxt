require 'ramaze'
require 'twitter'

if Gem.win_platform?
  require 'openssl'
  #Really, really bad workaround. All other solutions did not work for me.
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end

DEBUG_KEYS = false

if DEBUG_KEYS
  require_relative 'debug_keys'
end

module TwitterClient
  CLIENT = Twitter::REST::Client.new { |config|
    config.consumer_key = ENV['CONSUMER_KEY']
    config.consumer_secret = ENV['CONSUMER_SECRET']
    config.access_token = ENV['ACCESS_TOKEN']
    config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
  }
end

require_relative 'web_controller'

if ARGV[0] == nil
  port = 7000
else
  port = ARGV[0]
end

Ramaze.start(:port => port)