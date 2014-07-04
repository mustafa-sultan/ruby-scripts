#!/usr/bin/env ruby
#
# A simple tcp server which will excute any user provided command 
# Written by Mustafa Alaa

require 'socket'

hostname = "localhost"
port = 1337

server = TCPServer.open(hostname, port)
puts "Listening on #{hostname}:#{port}"
client = server.accept

loop do
	client.puts "\nCommand to excute: \n"
	cmd = client.gets.chomp
	client.close if cmd == "exit"
	output = `#{cmd}`
	client.puts output
end
