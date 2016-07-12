class CreateCommutes < ActiveRecord::Migration[5.0]
  def change
    create_table :commutes do |t|
      t.references :user, foreign_key: true
      t.datetime :starttime
      t.datetime :endtime

      t.timestamps
    end
    add_index :commutes, [:user_id, :created_at]
  end
end
