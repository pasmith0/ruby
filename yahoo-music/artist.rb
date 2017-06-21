# === Artists:
#require "rubygems"
#require "active_record"
#require "activesupport"
require 'yahoo-music'
include Yahoo::Music
Yahoo::Music.app_id = "Ss8RV5DV34E0W8YFy67IYWYMV3d026FSKf0cYgDIIFNlRnHJpghn.3D01kCZ"

artist = Artist.new("Ben Folds Five")

puts artist.name
puts artist.website

puts '*' * 40
puts

puts 'Releases'
artist.releases.each do |release|
  puts "\t- %s" % release.title
end


