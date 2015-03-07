class Point < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.text :status
      t.integer :value
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
