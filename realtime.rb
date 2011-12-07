require './gtfs-realtime.pb'
require 'beefcake'
# require 'eventmachine'
# require 'em-http-request'
require 'open-uri'
require 'ap'

APP_ID = "YOUR_TRIMET_APP_ID"
url = "http://developer.trimet.org/ws/V1/TripUpdate?appID=#{APP_ID}"

# Read the feed, decode it, and display it as a hash
ap FeedMessage.decode(open(url).read).to_hash

# In theory, beefcake is supposed built to work with eventmachine for http streaming
# However, I can't find any examples of this working…
#
# This was an attempt to get it working, which didn't succeed in opening a stream.
# Either I'm using EM wrong, or trimet's realtime stuff isn't actually streaming…
#
# EventMachine.run do
#   http = EventMachine::HttpRequest.new(url).get
#   decoded = FeedMessage.new
#   http.stream do |chunk|
#     # puts chunk
#     FeedMessage.decode(chunk, decoded)
#   end
#   puts decoded
# end

