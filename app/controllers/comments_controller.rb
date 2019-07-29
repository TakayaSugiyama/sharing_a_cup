class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comments_params)
    @comment.post_id = params[:post_id]
    
    if @comment.save 
      flash["success"] = "コメントを作成しました。"
      redirect_to  post_url(@comment.post)
    else
      @error_message = "投稿に失敗しました。"
      @post = Post.find(params[:post_id])
      render "posts/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy 
    flash[:success] = "コメントを削除しました。"
    redirect_to  post_url(@comment.post)
  end
  
  def like 
    comment = Comment.find_by(id: params[:comment_id])
    @like = CommentFavorite.new(user_id: current_user.id, comment_id: params[:comment_id], post_id: comment.post.id)
    @like.save
    redirect_to post_url(comment.post)
  end 
  
  def unlike 
    comment = Comment.find_by(id: params[:comment_id])
    @like = CommentFavorite.find_by(user_id: current_user.id,comment_id: params[:comment_id],post_id: comment.post.id)
    @like.destroy
    redirect_to post_url(comment.post)
  end
  
  private 
  
  def comments_params 
     params.require(:comment).permit(:comment,:title)
  end
   
end
