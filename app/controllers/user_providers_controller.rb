class UserProvidersController < ApplicationController
  before_action :set_user_provider, only: [:show, :edit, :update, :destroy]

  # GET /user_providers
  # GET /user_providers.json
  def index
    @user_providers = UserProvider.all
  end

  # GET /user_providers/1
  # GET /user_providers/1.json
  def show
  end

  # GET /user_providers/new
  def new
    @user_provider = UserProvider.new
  end

  # GET /user_providers/1/edit
  def edit
  end

  # POST /user_providers
  # POST /user_providers.json
  def create
    @user_provider = UserProvider.new(user_provider_params)

    respond_to do |format|
      if @user_provider.save
        format.html { redirect_to @user_provider, notice: 'User provider was successfully created.' }
        format.json { render :show, status: :created, location: @user_provider }
      else
        format.html { render :new }
        format.json { render json: @user_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_providers/1
  # PATCH/PUT /user_providers/1.json
  def update
    respond_to do |format|
      if @user_provider.update(user_provider_params)
        format.html { redirect_to @user_provider, notice: 'User provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_provider }
      else
        format.html { render :edit }
        format.json { render json: @user_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_providers/1
  # DELETE /user_providers/1.json
  def destroy
    @user_provider.destroy
    respond_to do |format|
      format.html { redirect_to user_providers_url, notice: 'User provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_provider
      @user_provider = UserProvider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_provider_params
      params.require(:user_provider).permit(:user_id, :provider, :uid)
    end
end
