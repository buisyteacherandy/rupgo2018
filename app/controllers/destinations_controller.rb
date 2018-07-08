class DestinationsController < ApplicationController
  before_action :authenticate_user!, except: [:show,:index]
  before_action :set_destination, only: [:show, :edit, :update, :destroy, :publish]
  before_action :authenticate_editor!, only: [:new,:create,:update,:edit]
  before_action :authenticate_admin!, only: [:destroy, :publish]

  # GET /destinations
  # GET /destinations.json
  def index
    @destinations = Destination.search(params[:search])
    @destinations = Destination.paginate(page: params[:page], per_page:100).publicados.ultimos
    
  end

  # GET /destinations/1
  # GET /destinations/1.json
  def show
    #@deals = Deal.all
    @destination = Destination.find(params[:id])
    @comment = Comment.new
  end

  # GET /destinations/new
  def new
    @destination = Destination.new
    @categories = Category.all
    @regions = Region.all
  end

  def set_carousels
   @carousels = Carousel.all
  end

  # GET /destinations/1/edit
  def edit
  end

  # POST /destinations
  # POST /destinations.json
  def create
    @destination = current_user.destinations.new(destination_params)
    @destination.categories = params[:categories]
    @destination.regions = params[:regions]
    
    

    respond_to do |format|
      if @destination.save
        format.html { redirect_to @destination, notice: 'Destination was successfully created.' }
        format.json { render :show, status: :created, location: @destination }
      else
        format.html { render :new }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destinations/1
  # PATCH/PUT /destinations/1.json
  def update
    respond_to do |format|
      if @destination.update(destination_params)
        format.html { redirect_to @destination, notice: 'Destination was successfully updated.' }
        format.json { render :show, status: :ok, location: @destination }
      else
        format.html { render :edit }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  def publish
    @destination.publish!
    redirect_to @destination
  end

  # DELETE /destinations/1
  # DELETE /destinations/1.json
  def destroy
    @destination.destroy
    respond_to do |format|
      format.html { redirect_to destinations_url, notice: 'Destination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination
      @destination = Destination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def destination_params
      params.require(:destination).permit(:place, :why_go, :to_do, :sights, :festivals, :sleep, :eat, :drink, :shop, :around, :cover, :categories, :regions, :category, :filter)
    end
end
