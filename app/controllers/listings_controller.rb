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
    @listing = Listing.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  # TO DO // Consider changing redirect to dashboard once its been implemented
  def destroy
    Listing.find(params["id"]).destroy
    
    redirect_to listings_path
  end
end
