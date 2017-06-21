# This ruby script uses the itunes-search gem
# There are others

require 'itunes-search'
require 'date'

unless ARGV.length == 1
  puts "Please enter the artist name."
  puts "Usage: ruby itunes-search.rb artist_name \n"
  exit
end

artist = ARGV[0]

include ItunesSearch
results = ItunesSearch.search("term"=>artist).results

if results.length == 0
	puts "No results found"
	exit
end

puts "collectionName\tyear\ttrackNumber\ttrackName"

tracklist = results.sort_by { |a| [ a.releaseDate, a.collectionName, a.trackNumber ] }

# raw data
#i = 0
#results.each do |result|
	#puts result.trackViewUrl
	#i = i + 1
	#puts i.to_s + "\t" + result.collectionName + "\t" + result.trackName
#	puts result.collectionName + "\t" + result.trackNumber.to_s +  "\t" + result.trackName
#end

# sorted data
tracklist.each do |track|
	date = DateTime.strptime(track.releaseDate)
	puts track.collectionName + "\t" + date.year.to_s + "\t" + track.trackNumber.to_s + "/" + track.trackCount.to_s + "\t" + track.trackName
end
	

