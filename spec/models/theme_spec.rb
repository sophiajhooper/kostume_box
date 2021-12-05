require "rails_helper"

RSpec.describe Theme, type: :model do
  describe "Direct Associations" do
    it { should have_many(:costumes) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
