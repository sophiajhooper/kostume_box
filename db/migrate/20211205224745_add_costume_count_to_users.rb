class AddCostumeCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :costumes_count, :integer
  end
end
