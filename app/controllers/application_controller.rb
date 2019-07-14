class ApplicationController < ActionController::Base
    include SessionsHelper
    include FavoritesHelper
    include UsersHelper
    
    
    # ログインユーザーのみ許可する。
    def auth_logined_user 
        if  !current_user
           flash[:danger] = "許可がありません。ログインが必要です。"
           redirect_to root_url
        end
    end
    
    #　同じユーザーのみ許可
    def only_user 
        if current_user.id != params[:id].to_i
            flash[:danger] = "他人の情報を編集できません。"
            redirect_to root_url
        end
    end
    
end

