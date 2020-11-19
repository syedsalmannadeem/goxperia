class LocationsController < ApplicationController
  before_action :set_location, only: [:show]

  def index
    @locations = Location.all

     # Make Form Sticky
    @category = params["category"].present? ? params["category"] : []
    @state = params["state"].present? ? params["state"] : helpers.location_options.values
     # Search Term (searches name)
     @name = params["search"].present? ? params["search"]["name"] : ""

    # Category (Default to all categories if we don't have any)
    category_id_array = @category
    if category_id_array.length() == 0
      category_id_array = [1,2,3,4]
    end


    # The Query
    @locations = Location
    .where("name ILIKE ? OR company_name ILIKE ? OR description ILIKE ?", "%#{@name}%", "%#{@name}%", "%#{@name}%")
    .where(category: category_id_array)
    .where(state: @state)
    .order("NULLIF(preferred, false) ASC NULLS LAST", :city, :name)
    .page(params[:page]).per(15)
  end

  def show
    @related_locations = Location
    .where(category: @location.category)
    .where(state: @location.state)
    .where.not(id: @location.id)
    .limit(3)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

end
