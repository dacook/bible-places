#WIP: how to create a rake task?..
require 'csv'
namespace :openbible do
  task :load_places_from_csv => :environment do
    CSV.foreach(settings.openbible_places, headers: true, col_sep: "\t") do |row|
      #Place.new_from_openbible(row.to_hash)
    end 
  end
end 