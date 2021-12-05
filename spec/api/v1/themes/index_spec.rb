require "rails_helper"

RSpec.describe "themes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/themes", params: params
  end

  describe "basic fetch" do
    let!(:theme1) { create(:theme) }
    let!(:theme2) { create(:theme) }

    it "works" do
      expect(ThemeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["themes"])
      expect(d.map(&:id)).to match_array([theme1.id, theme2.id])
    end
  end
end
