class AddChecklist < ActiveRecord::Migration[5.1]
  def change
  	add_column :subcategories, :checklist, :boolean
  end
end
