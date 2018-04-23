class AddDateNextStep < ActiveRecord::Migration[5.1]
  def change
  	add_column :plan_capabilities, :nextstepdate, :date
  	add_column :plan_capabilities, :nextstepdesc, :string
  end
end
