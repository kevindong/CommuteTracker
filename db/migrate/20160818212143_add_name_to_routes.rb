class AddNameToRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :routes, :name, :string
  end
end
