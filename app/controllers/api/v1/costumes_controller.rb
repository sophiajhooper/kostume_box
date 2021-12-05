class Api::V1::CostumesController < Api::V1::GraphitiController
  def index
    costumes = CostumeResource.all(params)
    respond_with(costumes)
  end

  def show
    costume = CostumeResource.find(params)
    respond_with(costume)
  end

  def create
    costume = CostumeResource.build(params)

    if costume.save
      render jsonapi: costume, status: :created
    else
      render jsonapi_errors: costume
    end
  end

  def update
    costume = CostumeResource.find(params)

    if costume.update_attributes
      render jsonapi: costume
    else
      render jsonapi_errors: costume
    end
  end

  def destroy
    costume = CostumeResource.find(params)

    if costume.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: costume
    end
  end
end
