class UsersController < ApplicationController
  before_action :auth_logined_user,only: [:show,:edit,:update]
  before_action :only_user, only: [:edit,:update]
  
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params) 
    if @user.save
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to user_path(@user)
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
  
  
  def like 
    @user = User.find(params[:id])
    @likes = @user.favorites.reverse
  end
  
  def comment
    @user = User.find(params[:id])
    @comments = Comment.where(user_id: @user.id)
  end
  
  
  def like_comment 
    @user = User.find(params[:id])
    @comments = CommentFavorite.where(user_id: @user.id)
  end 
  
  private 
    def user_params 
      params.require(:user).permit(:name,:email,:password,:password_confirmation,:image_name)
    end
    
end
