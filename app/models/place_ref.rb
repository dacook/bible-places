require 'csv'

class PlaceRef < ActiveRecord::Base
  belongs_to :place
  belongs_to :book

  def self.new_from_list(place, list)
    prs = []

    CSV.parse(list).first.each do |ref|
      prs << pr = new 
      pr.place = place

      r = Bible::parse_reference(ref)

      pr.book = Book.find_by_name(r[:book]) || Book.create(name: r[:book])

      pr.chapter = r[:chapter]
      pr.verse   = r[:verse]
      if r[:chapter_end]
        pr.chapter_end = r[:chapter_end]
        pr.verse_end = r[:verse_end]
      end

      pr.save
    end
    
    prs
  end
end