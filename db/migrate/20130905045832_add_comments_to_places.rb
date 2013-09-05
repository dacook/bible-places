class AddCommentsToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :comments, :string
  end
end
