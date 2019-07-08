class ApplicationController < ActionController::Base
    include SessionsHelper
    
    # ログインユーザーのみ許可する。
    def auth_logined_user 
        if  !current_user
           flash[:danger] = "許可がありません。ログインが必要です。"
           redirect_to root_url
        end
    end
end

