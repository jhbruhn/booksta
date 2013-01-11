class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def do_response(model)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => model }
    end
  end
  
end
