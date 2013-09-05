class CreatePlaceRefsAndBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string  :name
    end

    create_table :place_refs do |t|
      t.references  :place
      t.references  :book
      t.integer     :chapter
      t.integer     :verse
      t.integer     :chapter_end
      t.integer     :verse_end
    end
  end
end
