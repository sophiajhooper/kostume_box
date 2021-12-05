class AddLocationLatitudeToCostume < ActiveRecord::Migration[6.0]
  def change
    add_column :costumes, :location_latitude, :float
  end
end
