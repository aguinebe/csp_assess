class AddAnswer < ActiveRecord::Migration[5.1]
  def change
  	add_column :plan_capabilities, :answer, :text
  end
end
