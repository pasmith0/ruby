
require 'flacinfo'

count = 0
Dir.glob("*.flac") do |f|
  count += 1
  song=FlacInfo.new(f)
  puts f
  #song.print_tags
  puts "  TITLE:  " + song.tags['TITLE']
  puts "  ARTIST: " + song.tags['ARTIST']
end
puts ""
puts "Examined #{count} files"