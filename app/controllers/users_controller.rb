class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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
      if !@user.image_name?
        @user.image_name.url =  "/uploads/user/image_name/default.png"
      end
      flash[:success] = "登録に成功しました。"
      redirect_to @user 
    else 
      flash.now[:danger] = "登録に失敗しました。"
      render "users/new"
    end
  end
  
  def login_form
    @user = User.new
  end
  
  
  
  private 
    def user_params 
      params.require(:user).permit(:name,:email,:password,:password_confirmation,:image_name)
    end
    
end
