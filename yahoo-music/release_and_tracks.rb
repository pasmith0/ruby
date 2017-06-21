#=== Releases & Tracks:

require 'yahoo-music'
include Yahoo::Music
Yahoo::Music.app_id = "Ss8RV5DV34E0W8YFy67IYWYMV3d026FSKf0cYgDIIFNlRnHJpghn.3D01kCZ"

album = Album.search("The White Album").first 

puts album.title
puts album.artist
puts "Release Date:" + album.released_on.strftime("%m/%d/%Y")

puts '*' * 40
puts

puts 'Tracks'
artist.tracks.each_with_index do |track, i|
  puts "\t%d %s \t%2d:%2d" % [i, track.title, track.duration / 60, track.duration % 60]
end

