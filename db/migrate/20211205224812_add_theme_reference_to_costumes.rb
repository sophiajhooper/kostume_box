class AddThemeReferenceToCostumes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :costumes, :themes
    add_index :costumes, :theme_id
  end
end
