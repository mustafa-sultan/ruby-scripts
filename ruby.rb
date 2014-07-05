#!/usr/bin/env ruby
#
# My first ruby script
# Written by Mustafa Alaa

require 'colorize'

file = "Readme.txt"

puts "Hello.".blue
puts

puts "Current working directory is: ".blue
puts Dir.pwd.red
puts

def ls(path, type)
	if type == "file"
		Dir.entries("#{path}").each do |file|
			puts file if File.file?( file )  == true 
	elsif type == "folder"
		Dir.entries("#{path}").each do |file|
        		puts file if File.directory?( file ) == true
		end
	else 
		puts "Please specify a correct type."
	end
end

puts "Current files in #{Dir.pwd} are:".blue
ls(".", 'file')

puts "Current folders in #{Dir.pwd} are:".blue
ls(".", 'folder')


puts "Creating Readme.txt".blue
out_file = File.new(file, "w")
out_file.puts("Hello World!")
out_file.close
puts

puts "Reading contents of #{file}".blue
puts File.read(file).red

puts "Backup files in current directory".blue
system( 'tar -czf backup.tar.gz --exclude=backup.tar.gz .' )
puts

puts "Renaming file according to current date".blue
date = Time.now.strftime("%m.%d.%Y")
File.rename("backup.tar.gz", "#{date}.tar.gz")

puts "\nDone.".green
