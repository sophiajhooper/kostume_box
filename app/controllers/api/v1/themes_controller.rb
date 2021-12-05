class Api::V1::ThemesController < Api::V1::GraphitiController
  def index
    themes = ThemeResource.all(params)
    respond_with(themes)
  end

  def show
    theme = ThemeResource.find(params)
    respond_with(theme)
  end

  def create
    theme = ThemeResource.build(params)

    if theme.save
      render jsonapi: theme, status: :created
    else
      render jsonapi_errors: theme
    end
  end

  def update
    theme = ThemeResource.find(params)

    if theme.update_attributes
      render jsonapi: theme
    else
      render jsonapi_errors: theme
    end
  end

  def destroy
    theme = ThemeResource.find(params)

    if theme.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: theme
    end
  end
end
