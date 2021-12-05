class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :reviewer_id
      t.text :review_text
      t.integer :costume_id
      t.integer :star_rating

      t.timestamps
    end
  end
end
