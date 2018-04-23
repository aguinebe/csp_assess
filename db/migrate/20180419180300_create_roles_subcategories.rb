class CreateRolesSubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :roles_subcategories do |t|
      t.integer :role_id
      t.integer :subcategory_id

      t.timestamps
    end
  end
end
