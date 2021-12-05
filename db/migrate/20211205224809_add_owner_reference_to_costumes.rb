class AddOwnerReferenceToCostumes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :costumes, :users, column: :owner_id
    add_index :costumes, :owner_id
    change_column_null :costumes, :owner_id, false
  end
end
