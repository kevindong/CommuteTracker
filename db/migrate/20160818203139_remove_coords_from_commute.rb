class RemoveCoordsFromCommute < ActiveRecord::Migration[5.0]
  def change
    remove_column :commutes, :startLat, :float
    remove_column :commutes, :startLon, :flat
    remove_column :commutes, :endLat, :float
    remove_column :commutes, :endLon, :float
  end
end
