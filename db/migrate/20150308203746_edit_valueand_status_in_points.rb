class EditValueandStatusInPoints < ActiveRecord::Migration
  def up
    remove_column :points, :status
    add_column :points, :redeemed_points, :integer
    rename_column :points, :value, :available_points
  end

  def down
    add_column :points, :status, :text
    remove_column :points, :redeemed_points
    rename_column :points, :available_points, :value
  end
end
