class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by_name(params[:user][:name])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            return head(:forbidden)
        end
    end

    def destroy
        session.delete :name
        redirect_to login_path  
    end
end
