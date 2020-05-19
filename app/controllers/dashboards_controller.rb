class DashboardsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user

    # Seller dashboard
    def pending_listings_index
        #creates an anonymous scope - why is this necessary? (Is this like initialising it?)
        @listings = Listing.where(nil) 
        # Is it safe to do it like this compared to the example using the params here
        # @listings = @user.listings.filter_by_status(params[:status]) if params[:status].present?
        @listings = @user.listings.filter_by_status("pending_completion")
    end

    def pending_listings_update
        @listing = @user.listings.find(params[:id])
        @listing.update(status: params[:status])
        @listing.purchase.update(btc_sent: "sent")
        num_of_completed_listings = @listing.user.num_completed_listings += 1
        @listing.user.update(num_completed_listings: num_of_completed_listings)
      
        redirect_to completed_listings_path
    end

    def available_listings_index
        @listings = Listing.where(nil)
        @listings = @user.listings.filter_by_status("available_listing")
    end

    def available_listings_destroy
        @listing = @user.listings.find(params[:id])
        @listing.destroy

        redirect_to available_listings_path
    end

    def completed_listings_index
        @listings = Listing.where(nil)
        @listings = @user.listings.filter_by_status("completed_listing")
    end

    # Buyer dashboard
    def current_purchase_orders_index
        @purchases = Purchase.where(nil)
        @purchases = @user.purchases.filter_by_btc_sent("not_sent")
    end

    def purchase_history_index
        @purchases = Purchase.where(nil)
        @purchases = @user.purchases.filter_by_btc_sent("sent")
    end

    # Once purchase is made, update feedback for listing and the owners feedback_score
    def user_feedback_update
        @purchase = @user.purchases.find(params[:id])
        @listing = @purchase.listing
        @listing.update(feedback_for_seller: params[:feedback_for_seller])

        @listings = Listing.where(nil)
        @listings = @purchase.listing.user.listings.filter_by_status("completed_listing")
        num_of_seller_completed_listings = @listings.count
        
        @listings = Listing.where(nil)
        @listings = @purchase.listing.user.listings.filter_by_feedback_for_seller("positive")
        num_of_seller_positive_feedback_listings = @listings.count

        updated_user_feedback_score = (num_of_seller_positive_feedback_listings/num_of_seller_completed_listings.to_f)
        @purchase.listing.user.update(feedback_score: updated_user_feedback_score)
      
        redirect_to purchase_history_path
    end


    private

    def set_user
        # only logged in user accesses Dashboard pages
        @user = current_user
    end

end