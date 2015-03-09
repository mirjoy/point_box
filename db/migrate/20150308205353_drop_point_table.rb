class DropPointTable < ActiveRecord::Migration
  def change
    drop_table :points
  end
end
