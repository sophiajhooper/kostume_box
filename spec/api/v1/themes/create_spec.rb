require "rails_helper"

RSpec.describe "themes#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/themes", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "themes",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(ThemeResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { Theme.count }.by(1)
    end
  end
end
