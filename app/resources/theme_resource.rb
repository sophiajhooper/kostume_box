class ThemeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :theme, :string

  # Direct associations

  has_many :costumes

  # Indirect associations
end
