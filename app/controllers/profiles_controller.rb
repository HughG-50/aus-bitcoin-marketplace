class ProfilesController < ApplicationController
    before_action :authenticate_user!, :except => [:index]
    # before_action :authenticate_user!
    
    def index 
        @user = User.find(params[:id])
    end
    
    def show 
        if User.find(params[:id]) != current_user
            redirect_to user_path
        else
            @user = current_user
        end
    end

    def edit 
        if User.find(params[:id]) != current_user
            redirect_to user_path
        else
            @user = current_user
        end
    end
end