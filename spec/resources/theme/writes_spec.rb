require "rails_helper"

RSpec.describe ThemeResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "themes",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ThemeResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Theme.count }.by(1)
    end
  end

  describe "updating" do
    let!(:theme) { create(:theme) }

    let(:payload) do
      {
        data: {
          id: theme.id.to_s,
          type: "themes",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ThemeResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { theme.reload.updated_at }
      # .and change { theme.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:theme) { create(:theme) }

    let(:instance) do
      ThemeResource.find(id: theme.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Theme.count }.by(-1)
    end
  end
end
