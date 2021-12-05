class ReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :reviewer_id, :integer
  attribute :review_text, :string
  attribute :costume_id, :integer
  attribute :star_rating, :integer

  # Direct associations

  belongs_to :costume

  belongs_to :reviewer,
             resource: UserResource

  # Indirect associations
end
