class AddLocationFormattedAddressToCostume < ActiveRecord::Migration[6.0]
  def change
    add_column :costumes, :location_formatted_address, :string
  end
end
