class ChangeTimeColumns < ActiveRecord::Migration
  def self.up
    rename_column :events, :end, :end_time
  end

  def self.down
    rename_column :events, :end_time, :end
  end
end
