class AddAttributesToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :attributes, :string
  end
end
