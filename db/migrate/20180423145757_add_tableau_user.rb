class AddTableauUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :plan_capabilities, :tableauuserid, :string
  end
end
