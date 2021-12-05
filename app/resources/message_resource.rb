class MessageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :sender_id, :integer
  attribute :receiver_id, :integer
  attribute :message_text, :string
  attribute :costume_id, :integer

  # Direct associations

  belongs_to :costume

  belongs_to :receiver,
             resource: UserResource

  belongs_to :sender,
             resource: UserResource

  # Indirect associations
end
