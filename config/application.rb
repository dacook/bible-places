# Enable the public folder
set :static, true

set :map_key, ENV['MAP_KEY']

set :esv_key, ENV['ESV_KEY']

set :openbible_places, './lib/openbible/merged.txt'