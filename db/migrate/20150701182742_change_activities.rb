class ChangeActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :record_date
    rename_column :activities, :record_number, :number
    rename_column :activities, :very_active_minutes, :active_minutes
    change_column :activities, :distance, :float, precision: 4, scale: 2
  end
end
