class AddHasActiveCommuteToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hasActiveCommute, :boolean, default: false
  end
end
