class ListingsController < ApplicationController
  # Testing that devise Gem worked
  # before_action authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show_basic]

  def index
    @listings = Listing.all.order(price_BTC_AUD: :asc)
  end

  def show_basic

  end

  # By default this is the listing we will load when a user clicks on a listing
  # must be logged in
  def show
    set_listing
  end

  def new
    @listing = Listing.new
    # Hardcoding that payments must be CC until functionality to other payments is expanded
    # NEED TO CHECK WHETHER THIS IS VALID TO DO LIKE THIS
    
    # Also check User ID whether it needs to be in the input
    @listing.payment_method = "Credit Card"
    # @listing.save!
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
    @listing = Listing.new
    @listing.payment_method = "Credit Card"
  end

  def update
    # instead of create we are updating
    @listing = Listing.update(params["id"], listing_params)
    if @listing.errors.any?
        render "edit"
    else 
        redirect_to listings_path
    end
  end

  # TO DO // Consider changing redirect to dashboard once its been implemented
  def destroy
    Listing.find(params["id"]).destroy
    
    redirect_to listings_path
  end

  private 

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :payment_method, :price_BTC_AUD, :amount, :user_id)
  end

end
