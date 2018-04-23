class Addbackcapid < ActiveRecord::Migration[5.1]
  def change
  	add_column :plan_capabilities, :capability_id, :integer
  end
end
