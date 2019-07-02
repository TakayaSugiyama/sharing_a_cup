class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def new
    @user = User.new
  end

  def update
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to @user 
    else 
      render "users/new"
    end
  end
  
  def login_form
    
  end
  
  def login 
  end
  
  private 
    def user_params 
      params.require(:user).permit(:name,:email,:password)
    end
  
end
