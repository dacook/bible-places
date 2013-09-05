#load places from http://www.openbible.info/geo/data/merged.txt
require 'csv'
module OpenBible
  def OpenBible::load_places
    # file = settings.openbible_places
    file = './lib/openbible/merged.txt'

    ActiveRecord::Base.transaction do 
      CSV.foreach(file, headers: true, col_sep: "\t") do |row|
        puts Place.new_from_openbible(row)
      end 
    end
    
  end
end