require "rails_helper"

RSpec.describe "themes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/themes/#{theme.id}"
  end

  describe "basic destroy" do
    let!(:theme) { create(:theme) }

    it "updates the resource" do
      expect(ThemeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Theme.count }.by(-1)
      expect { theme.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
