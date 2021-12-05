class AddCostumeCountToThemes < ActiveRecord::Migration[6.0]
  def change
    add_column :themes, :costumes_count, :integer
  end
end
