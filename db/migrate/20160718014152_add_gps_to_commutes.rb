class AddGpsToCommutes < ActiveRecord::Migration[5.0]
  def change
    add_column :commutes, :startLat, :decimal, :precision => 15, :scale=> 10
    add_column :commutes, :startLon, :decimal, :precision => 15, :scale=> 10
    add_column :commutes, :endLat, :decimal, :precision => 15, :scale=> 10
    add_column :commutes, :endLon, :decimal, :precision => 15, :scale=> 10
  end
end
