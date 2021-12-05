class AddCostumeReferenceToReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reviews, :costumes
    add_index :reviews, :costume_id
    change_column_null :reviews, :costume_id, false
  end
end
