class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :datestamp
      t.integer :year
      t.integer :month
      t.integer :day
      t.datetime :record_date
      t.integer :record_number
      t.integer :steps
      t.integer :distance
      t.integer :calories
      t.integer :sedentary_minutes
      t.integer :very_active_minutes

      t.timestamps null: false
    end
  end
end
