class Place < ActiveRecord::Base
  # validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  has_many :place_refs

  def self.new_from_openbible(row)
    p = new

    p.name = row['#ESV']
    p.root_name = row['Root']

    #strip funny chars and save into attribs
    p.lat = row['Lat'].sub %r{^(\D*)}, '' 
    # attributes = [$~.captures.join]
    p.lon = row['Lon']
    # attributes << $~.captures.join
    # p.attribs = attributes.join ","
    p.attribs = $~.captures.join #just save one because they're both the same

    p.verses = row['Verses']
    p.comments = row['Comment']

    PlaceRef.new_from_list(p, p.verses)
    p.save
    p
  end
end