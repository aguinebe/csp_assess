class Attachplantosubcat < ActiveRecord::Migration[5.1]
  def change
  	rename_column :plan_capabilities, :capability_id, :subcategory_id
  end
end
