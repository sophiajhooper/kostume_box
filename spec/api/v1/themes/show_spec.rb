require "rails_helper"

RSpec.describe "themes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/themes/#{theme.id}", params: params
  end

  describe "basic fetch" do
    let!(:theme) { create(:theme) }

    it "works" do
      expect(ThemeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("themes")
      expect(d.id).to eq(theme.id)
    end
  end
end
