class AddCategory < ActiveRecord::Migration[5.1]
  def change
  	add_column :plan_capabilities, :category_id, :integer
  end
end
