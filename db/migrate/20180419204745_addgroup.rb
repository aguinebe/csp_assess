class Addgroup < ActiveRecord::Migration[5.1]
  def change
  	add_column :plan_capabilities, :groupname, :string
  end
end
