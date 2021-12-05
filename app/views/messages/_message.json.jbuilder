json.extract! message, :id, :sender_id, :receiver_id, :message_text,
              :costume_id, :created_at, :updated_at
json.url message_url(message, format: :json)
