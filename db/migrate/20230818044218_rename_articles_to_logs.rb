class RenameLogsToLogs < ActiveRecord::Migration[7.0]
  def self.up
    rename_table :logs, :logs
  end

  def self.down
    rename_table :logs, :logs
  end
end
