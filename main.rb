require_relative 'lib/importer'
require_relative 'lib/zone'
require_relative 'lib/rover'

importer = Importer.new File.read(ARGV[0] || 'example.data')

rover = Rover.new importer.start_vector

zone = Zone.new importer.x_max, importer.y_max
rover.add_observer(zone)

puts "START: #{rover}"

importer.commands.each do |command|
  begin
    rover.execute_command(command)
  rescue ArgumentError => error
    puts "ERROR: #{error.message}"
    break
  end
end

puts "FINAL: #{rover}"
