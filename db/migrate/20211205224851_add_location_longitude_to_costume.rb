class AddLocationLongitudeToCostume < ActiveRecord::Migration[6.0]
  def change
    add_column :costumes, :location_longitude, :float
  end
end
