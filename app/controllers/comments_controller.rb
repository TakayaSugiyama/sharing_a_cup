class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comments_params)
    @comment.post_id = params[:post_id]
    
    if @comment.save 
      flash["success"] = "コメントを作成しました。"
      redirect_to  post_url(@comment.post)
    else
      flash["danger"]  = "コメントの作成に失敗しました。"
      redirect_to root_url
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy 
    flash[:success] = "コメントを削除しました。"
    redirect_to  post_url(@comment.post)
  end
  
  private 
  
  def comments_params 
     params.require(:comment).permit(:comment,:title)
  end
   
end
