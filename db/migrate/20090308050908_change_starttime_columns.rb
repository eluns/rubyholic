class ChangeStarttimeColumns < ActiveRecord::Migration
  def self.up
    rename_column :events, :start, :start_time
  end

  def self.down
    rename_column :events, :start_time, :start
  end
end