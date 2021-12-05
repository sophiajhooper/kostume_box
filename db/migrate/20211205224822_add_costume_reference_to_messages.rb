class AddCostumeReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :costumes
    add_index :messages, :costume_id
    change_column_null :messages, :costume_id, false
  end
end
