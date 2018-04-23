class CreatePlanCapabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :plan_capabilities do |t|
      t.string :plan
      t.integer :capability_id

      t.timestamps
    end
  end
end
