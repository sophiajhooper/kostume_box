json.extract! costume, :id, :owner_id, :image, :title, :current_availability,
              :description, :location, :theme_id, :costume_type, :size, :created_at, :updated_at
json.url costume_url(costume, format: :json)
