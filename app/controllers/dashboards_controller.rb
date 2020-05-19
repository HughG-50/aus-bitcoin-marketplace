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
        @feedback_for_sellers = Purchase.feedback_for_sellers.keys
    end


    private

    def set_user
        # only logged in user accesses Dashboard pages
        @user = current_user
    end

    def listing_params
        params.require(:listing).permit(:title, :description, :payment_method, :price_BTC_AUD, :amount, :user_id, :status)
    end


    # NOTES:
    # @listings = current_user.listings
    # boolean check
    # Purchase.where(listing_id: 1).empty?
    # Or
    # Purchase.exists?(:purchase_id)
    # Does purchase exist where BTC is sent?
    # Purchase.exists?(:conditions => "BTC_sent = true")

end