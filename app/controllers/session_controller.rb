class SessionController < ApplicationController
  
  skip_before_filter :authorize

  
  def new
  end

  def create
    user=User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id]=user.id
      redirect_to "/firstpages/page"
    else
      redirect_to login_url, alert:"wrong password or username"    
    end
  end

  def destroy
    session[:user_id]= nil
    redirect_to "/firstpages/page", notice: "logout"
  end
end
