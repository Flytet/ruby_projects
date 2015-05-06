class Dungeon
  attr_accessor :player

  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
  end

  def start(location)
    @player.location = location
    show_current_description
    puts "Navigate using the keywords, 'north', 'east', 'south', 'west'."
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference}
  end

  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  def go(direction)
    puts "You go #{direction}."
    if find_room_in_direction(direction)
      @player.location = find_room_in_direction(direction)
      puts "You entered a new room!"
    else
      puts "It's a dead end."
    end
    show_current_description
  end

  class Player
    attr_accessor :location

    def initialize(name)
      @name = name
    end
  end

  class Room
    attr_accessor :reference, :name, :description, :connections

    def initialize(reference, name, description, connections)
      @reference, @name, @description, @connections = reference, name, description, connections
    end

    def full_description
      "You are in #{@description}"
    end
  end
end

# Create the main dungeon object
my_dungeon = Dungeon.new("Fred Bloggs")
# Add rooms to the dungeon
my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave.", {:west => :smallcave })
my_dungeon.add_room(:smallcave, "Small Cave", "a small, claustrophobic cave.", {:east => :largecave })
# Start the dungeon by placing the player in the large cave
my_dungeon.start(:largecave)
input = ""
while input != "exit"
  input = gets.chomp
  case input
  when "north"
    my_dungeon.go(input.to_sym)
  when "east"
    my_dungeon.go(input.to_sym)
  when "south"
    my_dungeon.go(input.to_sym)
  when "west"
    my_dungeon.go(input.to_sym)
  else
    puts "Valid navigation is: 'north', 'east', 'south', 'west'. Enter 'exit' to exit dungeon."
  end
end
