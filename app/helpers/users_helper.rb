module UsersHelper
     def only_valid_user 
      if params[:id] == current_user.id 
        redirect_to root_url
      end
     end
end
