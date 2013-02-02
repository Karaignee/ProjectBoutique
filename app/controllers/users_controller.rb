class UsersController < ApplicationController
  
  def index
    if not current_user or current_user[:level] != 1
      return redirect_to products_path
    end
    
    @users = User.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    @user.level = 5
    
    if @user.save
      redirect_to products_path, :notice => 'You are now signed up as a new member, please log in to continue!'
    else
      render :action => 'new'
    end
  end
  
  #def edit
  #  self.current_user
  #  render :action => 'edit'
  #end
  
  def show
    self.current_user
    
    if not @current_user
      redirect_to login_path
    else
      render :action => 'edit'
    end
  end
  
  def update
    self.current_user
    if params[:user]
      @user = User.find(params[:id])
      @user.email = params[:user][:email]
      @user.password = params[:user][:password]
      @user.first_name = params[:user][:first_name]
      @user.last_name = params[:user][:last_name]
      @user.profile_name = params[:user][:profile_name]
      
      respond_to do |format|
        if @user.save
          format.html { redirect_to settings_path, notice: 'Settings successfully updated.' }
        else
          format.html { redirect_to settings_path, notice: 'Error: Settings not updated!' }
        end
        format.json { head :no_content }
      end
    else
      @user = User.find(params[:id])
      @user.level = params[:level]
      @user[:updating_levels] = true
      
      respond_to do |format|
        if @user.save
          format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        else
          format.html { redirect_to users_path, notice: 'Error: User was not updated.' }
        end
        format.json { head :no_content }
      end
    end
  end
end