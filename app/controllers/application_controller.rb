class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery #with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  #before_filter :set_user_language
  before_filter :set_locale

  def set_user_language
    I18n.locale = current_user.language if user_signed_in?
  end

	def set_locale
	  I18n.locale = params[:locale]
	end

	# def extract_locale_from_tld
  #   parsed_locale = request.host.split('.').last
  #   I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale  : nil
  #  end

   def default_url_options(options={})
    {:locale => I18n.locale}
   end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :language
    end
end

