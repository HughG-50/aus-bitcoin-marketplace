class ListingsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show_basic]
  before_action :set_listing, only: [:show, :show_basic]

  def index
    # @listings = Listing.all.order(price_BTC_AUD: :asc)

    # Only shows available listings rather than all listings
    @listings = Listing.filter_by_status("available_listing").order(price_BTC_AUD: :asc)
  end

  # This will be where show redirects to if the current user is not signed in 
  # (i.e. show listing without the edit and delete options)
  def show_basic
  end

  # By default this is the listing we will load when a user clicks on a listing
  # must be logged in
  def show
  end

  def new
    @listing = Listing.new
  end

  def create 
    @listing = current_user.listings.create(listing_params)

    if @listing.errors.any?
        render "new"
    else 
        redirect_to listings_path
    end
  end

  def edit
    set_user_listing
  end

  def update
    @listing = Listing.update(params[:id], listing_params)
    if @listing.errors.any?
        render "edit"
    else 
        # redirect_to listings_path
        # redirect_to show_basic_path(@listing.id)
        redirect_to listing_path(@listing.id)
    end
  end

  # Create a purchase object for a listing
  def create_purchase 
    listing_id = params[:id]
    @listing = Listing.find(listing_id)
    user_id = @listing.user.id

    @purchase = current_user.purchases.create(user_id: user_id, listing_id: listing_id, btc_sent: "not_sent")
    @listing.update(status: "pending_completion")
    # p params 

    redirect_to current_purchase_orders_path
  end


  # TO DO // Consider changing redirect to dashboard once its been implemented
  def destroy
    Listing.find(params[:id]).destroy
    
    # redirect_to listings_path
    redirect_to available_listings_path
  end

  private 

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :payment_method, :price_BTC_AUD, :amount, :user_id, :status)
  end

  def set_user_listing
    id = params[:id]
    @listing = current_user.listings.find_by_id(id)

    if @listing == nil
      redirect_to listings_path
    end
  end

  # def purchase_params
  #   params.require(:purchase).permit(:user_id, :listing_id, :btc_sent)
  # end

end
