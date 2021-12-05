class CostumesController < ApplicationController
  before_action :current_user_must_be_costume_owner,
                only: %i[edit update destroy]

  before_action :set_costume, only: %i[show edit update destroy]

  def index
    @q = Costume.ransack(params[:q])
    @costumes = @q.result(distinct: true).includes(:owner, :messages,
                                                   :reviews, :theme, :reviewers).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@costumes.where.not(location_latitude: nil)) do |costume, marker|
      marker.lat costume.location_latitude
      marker.lng costume.location_longitude
    end
  end

  def show
    @review = Review.new
    @message = Message.new
  end

  def new
    @costume = Costume.new
  end

  def edit; end

  def create
    @costume = Costume.new(costume_params)

    if @costume.save
      message = "Costume was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @costume, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @costume.update(costume_params)
      redirect_to @costume, notice: "Costume was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @costume.destroy
    message = "Costume was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to costumes_url, notice: message
    end
  end

  private

  def current_user_must_be_costume_owner
    set_costume
    unless current_user == @costume.owner
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_costume
    @costume = Costume.find(params[:id])
  end

  def costume_params
    params.require(:costume).permit(:owner_id, :image, :title,
                                    :current_availability, :description, :location, :theme_id, :costume_type, :size)
  end
end
