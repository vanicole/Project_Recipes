class SessionsController < ApplicationController

    def create
        email = params[:user][:email]
        password = params[:user][:password]
        @current_user = Consumer.where(:email => email)
        if @current_user.length == 0 or 
            @current_user[0][:password] != password
        then 
            flash[:loginerror] = true 
            redirect_to login_path
        else
            session[:user] = @current_user[0][:email]
            session[:user_id] = @current_user[0][:id]
            redirect_to recipes_path
        end
    end


    def destroy
        session.delete(:user)
        redirect_to recipes_path
    end
end
