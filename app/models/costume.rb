require "open-uri"
class Costume < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :image, ImageUploader

  enum size: { "xs" => 0, "s" => 1, "m" => 2, "l" => 3, "xl" => 4, "one_size_fits_all" => 5,
               "na" => 6 }

  enum costume_type: { "accessory" => 0, "top" => 1, "bottom" => 2,
                       "full_costume" => 3 }

  enum current_availability: { "available" => 0, "unavailable" => 1 }

  # Direct associations

  belongs_to :theme,
             optional: true,
             counter_cache: true

  has_many   :reviews,
             dependent: :destroy

  has_many   :messages,
             dependent: :destroy

  belongs_to :owner,
             class_name: "User",
             counter_cache: true

  # Indirect associations

  has_many   :reviewers,
             through: :reviews,
             source: :reviewer

  # Validations

  # Scopes

  def to_s
    owner.to_s
  end
end
