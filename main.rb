require_relative 'lib/importer'
require_relative 'lib/zone'
require_relative 'lib/rover'

importer = Importer.new ARGV[0] || 'example.data'

rover = Rover.new importer.start_vector

puts rover

importer.commands.each do |command|
  puts command
  rover.execute_command(command)
  puts rover
  sleep 1
end

# zone = Zone.new importer.x_max, importer.y_max, rover
