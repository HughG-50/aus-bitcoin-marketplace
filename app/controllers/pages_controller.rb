class PagesController < ApplicationController 
    def home 
        @listings = Listing.all.order(created_at: :desc)
    end
end