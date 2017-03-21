#!/usr/bin/env ruby

require_relative 'lib/importer'
require_relative 'lib/rover'
require_relative 'lib/zone'
require_relative 'lib/zone_printer'

importer = Importer.new File.read(ARGV[0] || 'example.data')

rover = Rover.new importer.start_vector

zone = Zone.new importer.x_max, importer.y_max
rover.add_observer(zone)

zone_printer = ZonePrinter.new importer.x_max, importer.y_max
rover.add_observer(zone_printer)

puts "START: #{rover}"

importer.commands.each do |command|
  begin
    rover.execute_command(command)
    sleep(0.5)
  rescue ArgumentError => error
    puts "ERROR: #{error.message}"
    break
  end
end

puts "FINAL: #{rover}"
