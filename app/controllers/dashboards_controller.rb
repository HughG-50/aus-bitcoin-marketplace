class DashboardsController < ApplicationController
    before_action :authenticate_user!

    # Seller dashboard
    def pending_listings_index
        set_user_listing

    end

    def current_listings_index

    end

    def completed_listings_index

    end

    # Buyer dashboard
    def current_purchase_orders_index

    end

    def purchase_history_index

    end


    private

    def set_user_listing
        # only logged in user accesses Dashboard pages
        @user = current_user
        @listings = current_user.listings

        # Listings that have had purchase made - i.e. a listing that has a Purchase object
        # @listings_purchased = current_user.listings.includes(:purchase)

        # NEED TO FIND COMMANDS FOR RETURNING LIST OF LISTINGS THAT HAVE PURCHASE OBJECTS (I.E. BEEN PURCHASED)
        # COMMAND FOR RETURNING LIST OF PURCHASES ASSOCIATED WITH LISTINGS LIST

        # boolean check
        # Purchase.where(listing_id: 1).empty?
        # Or
        # Purchase.exists?(:purchase_id)
        # 
        # Does purchase exist where BTC is sent?
        # Purchase.exists?(:conditions => "BTC_sent = true")
     end


end