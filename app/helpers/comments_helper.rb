module CommentsHelper
    def liked?(comment)
        like =  CommentFavorite.find_by(user_id: current_user.id,comment_id: comment.id)
        if like.present?
            return true
        end
    end
end
