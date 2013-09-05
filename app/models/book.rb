
class Book < ActiveRecord::Base
  has_many :place_refs
  has_many :places, through: :place_ref
end