class CreateCostumes < ActiveRecord::Migration[6.0]
  def change
    create_table :costumes do |t|
      t.integer :owner_id
      t.string :image
      t.string :title
      t.integer :current_availability
      t.text :description
      t.string :location
      t.integer :theme_id
      t.integer :costume_type
      t.integer :size

      t.timestamps
    end
  end
end
