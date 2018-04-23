class CreateCapabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :capabilities do |t|
      t.integer :level
      t.string :description
      t.string :recommendation
      t.integer :subcategory_id

      t.timestamps
    end
  end
end
