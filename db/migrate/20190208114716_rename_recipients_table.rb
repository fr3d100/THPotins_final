class RenameRecipientsTable < ActiveRecord::Migration[5.2]
  def change
  	rename_table :join_table_pm_recipients, :recipients
  end
end
