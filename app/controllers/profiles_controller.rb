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

    def update 
        @user = User.update(params[:id], user_params)

        if @user.errors.any?
            render "edit"
        else
            redirect_to user_path
        end
    end

    private 

    def user_params
        params.require(:user).permit(:username, :bio, :btc_address, :feedback_score, :num_btc_purchases, :num_completed_listings, :country, :city)
    end
    
end