class UsersController < ApplicationController
  before_action :auth_logined_user,only: [:show,:edit,:update]
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) 
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to user_path
    else 
      flash.now[:danger] = "ユーザー情報を更新できませんでした。"
      render "users/edit"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      flash[:success] = "登録に成功しました。"
      session[:user_id] = @user.id   #ログインする
      redirect_to @user 
    else 
      flash.now[:danger] = "登録に失敗しました。"
      render "users/new"
    end
  end
  
  
  
  private 
    def user_params 
      params.require(:user).permit(:name,:email,:password,:password_confirmation,:image_name)
    end
    
end
