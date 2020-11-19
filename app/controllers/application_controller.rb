class ApplicationController < ActionController::Base
  before_action do
    ActiveStorage::Current.host = request.base_url
  end

  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      "admin"
    else
      "application"
    end
  end
end
