class AddSenderReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :users, column: :sender_id
    add_index :messages, :sender_id
    change_column_null :messages, :sender_id, false
  end
end
