class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.references :user, foreign_key: true
      t.float :startLat
      t.float :startLon
      t.float :endLat
      t.float :endLon

      t.timestamps
    end
  end
end
