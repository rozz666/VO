require 'World_loading'
require 'World_building'
require 'World_storing'

WORLD_FILE = "world.vo"

def worldExists
  File.file?(WORLD_FILE)
end

world = worldExists ? World.loadFromFile(WORLD_FILE) : World.build
world.run(1000)
world.storeInFile WORLD_FILE
