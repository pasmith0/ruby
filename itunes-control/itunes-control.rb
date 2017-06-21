require 'win32ole'
itunes = WIN32OLE.new('iTunes.Application')
itunes.BrowserWindow.MiniPlayer = true
#itunes.PlayPause

#itunes.SoundVolume = itunes.SoundVolume + 50
#itunes.SoundVolume = itunes.SoundVolume - 25

#itunes.PreviousTrack
#itunes.NextTrack

library = itunes.LibraryPlaylist
tracks = library.Tracks
#song = tracks.ItemByName('At Long Last Love')

songs = []

for track in tracks
    songs << track
end

if (songs.length == 0) then
	puts "No songs in library"
else
	songs.each do |song|
	    puts "Artist:" + song.Artist + "\tAlbum:" + song.Album + "\tTitle:" + song.Name + "\tTime:" + song.Time
	end
end

#...and then play the track by calling its Play method:

#song.Play

itunes.Quit


