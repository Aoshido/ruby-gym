class AddFieldsToLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :logs, :repetitions, :int
    add_column :logs, :weight, :int
  end
end
