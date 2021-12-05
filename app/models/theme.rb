class Theme < ApplicationRecord
  # Direct associations

  has_many   :costumes,
             dependent: :nullify

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    theme
  end
end
