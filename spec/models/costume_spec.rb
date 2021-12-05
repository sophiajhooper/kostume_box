require "rails_helper"

RSpec.describe Costume, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:theme) }

    it { should have_many(:reviews) }

    it { should have_many(:messages) }

    it { should belong_to(:owner) }
  end

  describe "InDirect Associations" do
    it { should have_many(:reviewers) }
  end

  describe "Validations" do
  end
end
