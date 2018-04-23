class AddReco < ActiveRecord::Migration[5.1]
  def change
  	add_column :capabilities, :highlevelreco, :text
  end
end
