class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
  	@user = User.new
  	@title = "Sign up"
  end

  def create
    # raise params[:user].inspect
    @user = User.new(params[:user])
    if @user.save      

      sign_in @user

      #handle the successful save
      #flash[:success] = "Welcome to the Sample App!" //gai note, can combime with redirect_to
      #redirect_to  user_path(@user) //gai notes; can do also @user without user_path
      redirect_to @user, :flash => {:success => "Welcome to the Sample App!"}
    else 
      @title = "Sign up"
      render 'new'
    end
  end


end
