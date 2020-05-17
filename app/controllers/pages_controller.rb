class PagesController < ApplicationController 
    def home 
        @listings = Listing.all.order(price_BTC_AUD: :asc)
    end
end