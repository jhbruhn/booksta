class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = Book.where(:user_id => params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @chapter }
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'Enjoy your changed Profile!' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
