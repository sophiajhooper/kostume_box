class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.text :message_text
      t.integer :costume_id

      t.timestamps
    end
  end
end
