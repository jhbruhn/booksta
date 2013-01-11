class ApplicationController < ActionController::Base
  protect_from_forgery
  
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
end
