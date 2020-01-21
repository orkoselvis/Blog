class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def show
    render "pages/about"
  end

  def require_user
    redirect_to root_path unless current_user
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private
  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to new_session_path, alert: 'Please Sign In or Sign Up!' if current_user.nil?
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def admin_authorize
    redirect_to new_session_path,
    alert: "Only for Admin!" unless current_user.admin
  end
end
