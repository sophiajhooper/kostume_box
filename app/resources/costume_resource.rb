class CostumeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :owner_id, :integer
  attribute :image, :string
  attribute :title, :string
  attribute :current_availability, :string_enum,
            allow: Costume.current_availabilities.keys
  attribute :description, :string
  attribute :location, :string
  attribute :theme_id, :integer
  attribute :costume_type, :string_enum, allow: Costume.costume_types.keys
  attribute :size, :string_enum, allow: Costume.sizes.keys

  # Direct associations

  belongs_to :theme

  has_many   :reviews

  has_many   :messages

  belongs_to :owner,
             resource: UserResource

  # Indirect associations

  many_to_many :reviewers,
               resource: UserResource
end
