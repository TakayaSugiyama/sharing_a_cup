class PostsController < ApplicationController
  before_action :auth_logined_user , only: [:new,:update,:edit,:create]
  before_action :only_posted_user, only: [:edit,:update,:destroy]
  
  def index
    @posts = Post.all.reverse
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @post.images.build
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      flash[:success] = "投稿を更新しました。"
      redirect_to post_url(@post)
    else
      render :edit
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save 
      flash[:success] = "投稿に成功しました。"
      redirect_to  posts_path
    else 
      flash.now[:danger] = "投稿に失敗しました。"
      render "posts/new"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url,success: "削除しました。"
  end
  
  private 
    def post_params 
      params.require(:post).permit(:title,:product_name,:price,:review,
          images_attributes: [:id, :image_name,:_destroy])
    end
    
    def only_posted_user 
      post = Post.find(params[:id])
      user = post.user
      if  user.id != current_user.id
        flash[:danger] = "他人の投稿は編集できません。"
        redirect_to posts_path
      end
    end
    
end

