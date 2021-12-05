class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :reviews,
             foreign_key: "reviewer_id",
             dependent: :destroy

  has_many   :costumes,
             foreign_key: "owner_id",
             dependent: :destroy

  has_many   :received_messages,
             class_name: "Message",
             foreign_key: "receiver_id",
             dependent: :destroy

  has_many   :sent_messages,
             class_name: "Message",
             foreign_key: "sender_id",
             dependent: :destroy

  # Indirect associations

  has_many   :reviewed_costumes,
             through: :reviews,
             source: :costume

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
