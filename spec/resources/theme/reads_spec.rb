require "rails_helper"

RSpec.describe ThemeResource, type: :resource do
  describe "serialization" do
    let!(:theme) { create(:theme) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(theme.id)
      expect(data.jsonapi_type).to eq("themes")
    end
  end

  describe "filtering" do
    let!(:theme1) { create(:theme) }
    let!(:theme2) { create(:theme) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: theme2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([theme2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:theme1) { create(:theme) }
      let!(:theme2) { create(:theme) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      theme1.id,
                                      theme2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      theme2.id,
                                      theme1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
