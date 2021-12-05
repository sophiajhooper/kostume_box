require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:reviews) }

    it { should have_many(:costumes) }

    it { should have_many(:received_messages) }

    it { should have_many(:sent_messages) }
  end

  describe "InDirect Associations" do
    it { should have_many(:reviewed_costumes) }
  end

  describe "Validations" do
  end
end
