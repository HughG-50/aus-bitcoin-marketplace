class ListingsController < ApplicationController
  # Testing that devise Gem worked
  # before_action authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
