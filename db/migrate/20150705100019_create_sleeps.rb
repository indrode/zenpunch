class CreateSleeps < ActiveRecord::Migration
  def change
    create_table :sleeps do |t|
      t.string :datestamp
      t.integer :year
      t.integer :month
      t.integer :day
      t.integer :number
      t.integer :asleep
      t.integer :awake
      t.integer :fallen_asleep
      t.integer :restless
      t.integer :restless_count
      t.float :efficiency, precision: 4, scale: 2
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
