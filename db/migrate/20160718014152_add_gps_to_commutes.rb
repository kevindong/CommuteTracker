class AddGpsToCommutes < ActiveRecord::Migration[5.0]
  def change
    add_column :commutes, :startLat, :float
    add_column :commutes, :startLon, :float
    add_column :commutes, :endLat, :float
    add_column :commutes, :endLon, :float
  end
end
