class AddStatusToLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :logs, :status, :string
  end
end
