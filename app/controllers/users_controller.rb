class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = Book.where(:user_id => params[:id])
    do_response @user
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
        render_error_response("", "edit", user)
        
      end
    end
  end
end
