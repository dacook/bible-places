class AddAttribsToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :attribs, :string
  end
end
