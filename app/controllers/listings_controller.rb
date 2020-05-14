class ListingsController < ApplicationController
  # Testing that devise Gem worked
  before_action :authenticate_user!
  def index
    @listings = Listing.all
    
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
