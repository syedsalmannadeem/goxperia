class Admin::LocationsController < AdminController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @locations = Location.all

     # Make Form Sticky
    @category = params["category"].present? ? params["category"] : []
    @state = params["state"].present? ? params["state"] : []

    # Search Term (searches name)
    @name = params["search"].present? ? params["search"]["name"] : ""

     # State (Default to all states if we don't have any)
     state_id_array = @state
     if state_id_array.length() == 0
       state_id_array = helpers.location_options.values
     end

    # Category (Default to all categories if we don't have any)
    category_id_array = @category
    if category_id_array.length() == 0
      category_id_array = [1,2,3,4]
    end

    # The Query
    @locations = Location
    .where("name ILIKE ? OR company_name ILIKE ? OR description ILIKE ?", "%#{@name}%", "%#{@name}%", "%#{@name}%")
    .where(category: category_id_array)
    .where(state: state_id_array)
    .order("preferred DESC NULLS LAST")
    .order(:city)
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    flash[:notice] = "The location was saved" if @location.save
    respond_with(:admin, @locations)
  end

  def update
    @location.update(location_params)
    respond_with(:admin, @locations)
  end

  def destroy
    @location.destroy
    respond_with(:admin, @location)
  end

  def upload_spreadsheet
    @spreadsheet = Location.new
  end

  def parse_spreadsheet
    require 'csv'

    path = location_params[:spreadsheet].path
    csv_text = File.read(path)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      entry = row.to_hash
      image_path = Dir.pwd + '/app/assets/image_import/' + entry['cover_image']
      location_params = {
        "company_name"=>entry['company_name'],
        "name"=>entry['name'],
        "city"=>entry['city'],
        "state"=>entry['state'],
        "zip"=>entry['zip'],
        "address"=>entry['address'],
        "phone"=>entry['phone'],
        "email"=>entry['email'],
        "website"=>entry['website'],
        "description"=>entry['description'],
        "category"=>entry['category'],
        "featured"=>"0"
      }
      @location = Location.new(location_params)
      @location.cover_image.attach(io: File.open(image_path), filename: entry['cover_image'])
      @location.save
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:company_name, :name, :city, :state, :zip, :address, :phone, :email, :website, :cover_image, :description, :category, :featured, :preferred, :spreadsheet)
    end
end
