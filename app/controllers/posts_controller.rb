class PostsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def update
  end

  def create
    @post = Post.new(posts_params)
    if @post.save 
      flash[:success] = "投稿に成功しました。"
      redirect_to  posts_path
    else 
      flash.now[:danger] = "投稿に失敗しました。"
      render "posts/new"
    end
  end
  
  private 
    def posts_params
       params.require(:post).permit(:title,:product_name,:price,:review)
    end
    
end

