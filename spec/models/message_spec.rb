require "rails_helper"

RSpec.describe Message, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:costume) }

    it { should belong_to(:receiver) }

    it { should belong_to(:sender) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
