class Reward < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.text :name
      t.integer :point_value
    end
  end
end
