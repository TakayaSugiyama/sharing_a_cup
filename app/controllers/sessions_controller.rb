class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    password = params[:password]
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      flash[:success] = "ログインしました。"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "ログインに失敗しました。"
      render "sessions/new"
    end
  end

  def destroy
    session[:user_id] = nil 
    flash[:success] = "ログアウトしました。"
    redirect_to root_url
  end
  
  def new
  end
  
end
