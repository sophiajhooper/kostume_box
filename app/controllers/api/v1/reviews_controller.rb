class Api::V1::ReviewsController < Api::V1::GraphitiController
  def index
    reviews = ReviewResource.all(params)
    respond_with(reviews)
  end

  def show
    review = ReviewResource.find(params)
    respond_with(review)
  end

  def create
    review = ReviewResource.build(params)

    if review.save
      render jsonapi: review, status: :created
    else
      render jsonapi_errors: review
    end
  end

  def update
    review = ReviewResource.find(params)

    if review.update_attributes
      render jsonapi: review
    else
      render jsonapi_errors: review
    end
  end

  def destroy
    review = ReviewResource.find(params)

    if review.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: review
    end
  end
end
