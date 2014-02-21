class UsersController < ApplicationController
  #layout false
  def new
    @user = User.new
    @title = "Sign Up"
    #render(:template => 'users/show')
    #render('users/show')
    #render('show')
  end
  def index
    #puts coll.find.first.inspect
    #@user = User.first.username
    #user = User.new(name: params[:name], email: params[:email])
    @users = User.order("id ASC")
    respond_to do |format|
      if request.xhr?
        format.json { render json: @users}
      else
        format.html{}
      end
    end
    #if user.nil?
    #  @user = user.get_name
    #else
    #  @user = "No user found!"
    #end
  end

  def show
    @user = User.find_by(username: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully!"
        redirect_to(:action => 'index')
    else
      render 'new'
    end
  end

  def update
    @user = User.find_by(username: params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "User updated successfully!"
      redirect_to(:action => 'show', :id => @user.username)
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find_by(username: params[:id])
  end

  def delete
    @user = User.find_by(username: params[:id])
  end

  def destroy
    user = User.find_by(username: params[:id])
    user.destroy
    flash[:notice] = "User '#{user.username}' deleted successfully!"
    redirect_to(:action => 'index')
  end
  private

    def user_params
      params.require(:user).permit(:username, :email)
    end

end
