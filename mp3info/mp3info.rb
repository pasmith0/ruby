require 'mp3info'

count = 0
#words = Hash.new { |h, k| h[k] = 0 }
Dir.glob("*.mp3") do |f|
  count += 1
  Mp3Info.open(f) do |mp3info|
    #title = mp3info.tag2.TIT2
    puts "[#{count}] File: " + f
	if  mp3info.tag2.TPE1
    	puts "  Artist:         " + mp3info.tag2.TPE1
	end
	if  mp3info.tag2.TALB
	    puts "  Album:          " + mp3info.tag2.TALB
	end
	if  mp3info.tag2.TIT2
		puts "  Title:          " + mp3info.tag2.TIT2
	end
	if  mp3info.tag2.TRCK
		puts "  Track:          " + mp3info.tag2.TRCK
	end
	if  mp3info.tag2.TYER
		puts "  Year:           " + mp3info.tag2.TYER
	end
	if  mp3info.tag2.TCON
		puts "  Content type:   " + mp3info.tag2.TCON
	end
	puts ""
    #next unless title
    #title.split(/\s/).each { |w| words[w.downcase] += 1 }
  end
end
puts "Examined #{count} files"
#words.to_a.sort{ |a, b| b[1] <=> a[1] }[0,100].each { |w| puts "#{w[0]}: #{w[1]}" }

