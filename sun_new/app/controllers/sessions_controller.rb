class SessionsController < ApplicationController
  def login
  end
  def new
  end
  def register
    @user=User.create!(:login=>params[:login],:password=>params[:password])
     if @user
      flash[:notice] = "Successful registration #{@user.login}"
      redirect_to login_path
    else
      flash[:notice] = " The register shibai"
      redirect_to login_path
    end
  end
  def create
    @user = User.authentication(params[:login], params[:password])
    if @user
      session[:user_id] = @user.id
      session[:user_name] = @user.login
      flash[:notice] = "welcome #{@user.login}"
      redirect_to posts_path
    else
      flash[:notice] = " The login shibai"
      redirect_to login_path
    end
  end
  def exit_now
     session[:user_id] = nil
     session[:user_name] = nil
     redirect_to posts_path
  end
  
end
