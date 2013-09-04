class Place < ActiveRecord::Base
  # validates :name, presence: true, length: { minimum: 3 }, uniqueness: true

  def self.from_csv(data)
    p = new
    row = CSV.parse_line(data)
    p.name = row[0]
    p.root_name = row[1]
    p.lat = row[2] #TODO: strip funny chars and save into attribs
    p.lon = row[3]
    # p.attributes = ''
    p.verses = row[4]

    # PlaceRefs.new_from_list(p.verses)
    end
    p
  end
end