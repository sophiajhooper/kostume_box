class ThemesController < ApplicationController
  before_action :set_theme, only: %i[show edit update destroy]

  def index
    @q = Theme.ransack(params[:q])
    @themes = @q.result(distinct: true).includes(:costumes).page(params[:page]).per(10)
  end

  def show
    @costume = Costume.new
  end

  def new
    @theme = Theme.new
  end

  def edit; end

  def create
    @theme = Theme.new(theme_params)

    if @theme.save
      redirect_to @theme, notice: "Theme was successfully created."
    else
      render :new
    end
  end

  def update
    if @theme.update(theme_params)
      redirect_to @theme, notice: "Theme was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @theme.destroy
    redirect_to themes_url, notice: "Theme was successfully destroyed."
  end

  private

  def set_theme
    @theme = Theme.find(params[:id])
  end

  def theme_params
    params.require(:theme).permit(:theme)
  end
end
