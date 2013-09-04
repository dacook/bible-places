class CreatePlace < ActiveRecord::Migration
  def up
    create_table :places do |t|
      t.string :name
      t.string :root_name
      t.decimal :lat, precision: 9, scale: 6
      t.decimal :lon, precision: 9, scale: 6
      t.string :verses
    end
  end

  def down
    drop_table :places
  end
end
