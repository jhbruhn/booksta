class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  
  def do_response(model)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => model }
    end
  end
  
  def render_error_response(alert, action, model)
    format.html { render :action => action, :alert => alert}
    format.json { render :json => model.errors, :status => :unprocessable_entity }
  end
  
  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale 
  end
end
