class ApplicationController < ActionController::Base
  before_action :set_locale

  private
  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def after_sign_in_path_for(resource)
    admin_path
  end
end
