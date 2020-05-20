class PagesController < ApplicationController 
    def home 
        @listings = Listing.filter_by_status("available_listing")
    end
end