class AddConvColumns < ActiveRecord::Migration[5.2]
  def change
  	add_column :conversations, :title, :string
  end
end
