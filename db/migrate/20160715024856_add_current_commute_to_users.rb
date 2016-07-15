class AddCurrentCommuteToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :currentCommute, :integer
  end
end
