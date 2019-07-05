module SessionsHelper
   def login? 
       if session[:user_id]
           return true
       end
   end
   
   def current_user 
       @current_user ||= User.find_by(id: session[:user_id])
   end
   
   
end
