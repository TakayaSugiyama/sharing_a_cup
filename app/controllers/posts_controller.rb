class PostsController < ApplicationController
  before_action :auth_logined_user , only: [:new,:update,:edit,:create]
  
  def index
    @posts = Post.all.reverse
  end

  def show
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @post.images.build
  end

  def update
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
    
end

