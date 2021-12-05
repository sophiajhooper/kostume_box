class Review < ApplicationRecord
  # Direct associations

  belongs_to :costume

  belongs_to :reviewer,
             class_name: "User",
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    reviewer.to_s
  end
end
