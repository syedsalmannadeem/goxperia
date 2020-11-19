class WelcomeController < ApplicationController
  def index
    @locations = Location.where(featured: true).limit(9)
    @category = params["category"].present? ? params["category"] : []
  end
end
