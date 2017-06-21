require 'rubygems'
require 'net/ssh'
require 'net/scp'

$HOSTNAME = 'etag01.dev06.he10' 
$USERNAME = 'mystro' 
$PASSWORD = 'mystro'
#REMOTE_FILE = '/var/log/httpd/access_log'
$REMOTE_FILE = 'remote.txt'
$MACADDR  = '000f216b3cfe'
$search_str = '8080'


def get_remote_file(file)
  rc = false
  Net::SCP.start($HOSTNAME, $USERNAME, :password => $PASSWORD) do |scp|
    # synchronous (blocking) upload; call blocks until upload completes
    begin
      scp.download! file, "."
    rescue
      puts "Error"
      rc = true
    else
      # code that runs ONLY if no error goes here
      puts "Success"
      rc = false
    ensure
      # code that cleans up goes here
      # gets executed for success or error
      puts "Cleanup"
    end

  end
  return rc
end

# Get remote file
#puts "Getting remote file " + $REMOTE_FILE
#rc = get_remote_file($REMOTE_FILE)
#puts "rc = " + rc.to_s

# search file 
puts "Searching for string \"" + $search_str + "\""
file = File.new($REMOTE_FILE)
file.readlines.each{ |line|
  print line if line =~ /#$search_str/
  #print line 
}

