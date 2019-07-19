module CommentsHelper
    def liked?(comment)
        like =  CommentFavorite.where(user_id: current_user.id,comment_id: comment.id,post_id: params[:id])
        if like.present?
            return true
        end
    end
end
