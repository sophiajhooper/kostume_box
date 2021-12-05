json.extract! review, :id, :reviewer_id, :review_text, :costume_id,
              :star_rating, :created_at, :updated_at
json.url review_url(review, format: :json)
