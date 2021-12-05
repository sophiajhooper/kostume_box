require "rails_helper"

RSpec.describe "themes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/themes/#{theme.id}", payload
  end

  describe "basic update" do
    let!(:theme) { create(:theme) }

    let(:payload) do
      {
        data: {
          id: theme.id.to_s,
          type: "themes",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ThemeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { theme.reload.attributes }
    end
  end
end
