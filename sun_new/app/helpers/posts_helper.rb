module PostsHelper
   def authen_user(user_id)
    admin=User.find(session[:user_id]).login == "zxc" if session[:user_id]!= nil
    session[:user_id] == user_id && user_id != nil ||  admin
   end
end
