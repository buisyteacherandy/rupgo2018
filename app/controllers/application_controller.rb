class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_locale
  before_action :set_categories
  before_action :set_regions
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :date_of_birth, :email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :date_of_birth, :email, :password, :current_password, :remember_me)}
  end

  def authenticate_editor!
    redirect_to root_path unless user_signed_in? && current_user.is_editor?
  end

  def authenticate_admin!
    redirect_to root_path unless user_signed_in? && current_user.is_admin?
  end

  private

    def set_locale
      I18n.locale = params[:locale] if params[:locale].present?
    end

    def default_url_options(options = {})
      {locale: I18n.locale}
    end

  def set_categories
    @categories = Category.all
  end

  def set_regions
    @regions = Region.all
  end

end