class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :first_name, :string
  attribute :last_name, :string

  # Direct associations

  has_many   :reviews,
             foreign_key: :reviewer_id

  has_many   :costumes,
             foreign_key: :owner_id

  has_many   :received_messages,
             resource: MessageResource,
             foreign_key: :receiver_id

  has_many   :sent_messages,
             resource: MessageResource,
             foreign_key: :sender_id

  # Indirect associations

  many_to_many :reviewed_costumes,
               resource: CostumeResource
end
