class AddFieldsToForm < ActiveRecord::Migration[5.1]
  def change
  	add_column :plan_capabilities, :priority, :integer
  	add_column :plan_capabilities, :recommendation, :text
  	add_column :subcategories, :question, :string
  	add_column :subcategories, :default_recommendation, :text
  end
end
