require 'csv'

class PlaceRef < ActiveRecord::Base
  belongs_to :place
  belongs_to :book

  def self.new_from_list(place, list)
    prs = []
    # TODO: move bible ref parse logic to separate function, make it work for spanning over multiple chapters.
    # Regular expression to capture each component of a contiguous bible verse reference (within one chapter).
    # Note: \u2013 and 2014 are en-dash and em-dash
    bible_verse_regex = %r{([a-zA-Z].+)\s(\d+):?(\d+)?\s*[\u2013\u2014]?\s*(\d+)?}

    CSV.parse(list).first.each do |ref|
      ref.strip =~ bible_verse_regex
      prs << pr = new 
      pr.place = place

      pr.book = Book.find_by_name($~.captures[0]) || Book.create(name: $~.captures[0])

      pr.chapter = $~.captures[1].to_i
      pr.verse   = $~.captures[2].to_i
      if $~.captures[3]
        pr.chapter_end = $~.captures[1].to_i 
        pr.verse_end = $~.captures[3].to_i
      end

      pr.save
    end
    
    prs
  end
end