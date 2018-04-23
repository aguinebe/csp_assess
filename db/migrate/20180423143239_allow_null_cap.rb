class AllowNullCap < ActiveRecord::Migration[5.1]
  def change
  	change_column :plan_capabilities, :capability_id, :integer, null: true
  end
end
