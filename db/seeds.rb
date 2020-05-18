User.destroy_all()

# User seeds
case Rails.env
when "development"
    user = User.new
    user.email = "admin@admin.com"
    user.password = "admin123"
    user.username = "admin"
    user.bio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    user.btc_address = "1FfmbHfnpaZjKFvyi1okTjJJusN455paPH"
    user.feedback_score = 98
    user.num_btc_purchases = 0
    user.num_completed_listings = 0
    user.country = "Australia"
    user.city = "Sydney"
    user.save!

    user = User.new
    user.email = "alice@admin.com"
    user.password = "admin123"
    user.username = "Alice"
    user.bio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    user.btc_address = "1LWPSnSdN8yYzVnfkYA6wpqZwQyVu4UDNY"
    user.feedback_score = 95
    user.num_btc_purchases = 0
    user.num_completed_listings = 0
    user.country = "Australia"
    user.city = "Melbourne"
    user.save!

    user = User.new
    user.email = "bob@admin.com"
    user.password = "admin123"
    user.username = "Bob"
    user.bio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    user.btc_address = "19yQtcX8JPkSTNyvA7sB2AQYAhmgt5t42c"
    user.feedback_score = 99
    user.num_btc_purchases = 0
    user.num_completed_listings = 0
    user.country = "Australia"
    user.city = "Melbourne"
    user.save!

    user = User.new
    user.email = "hugh@admin.com"
    user.password = "admin123"
    user.username = "Hugh"
    user.bio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    user.btc_address = "1mn9kFzaspNCpnwKHQVeRkQK3ZsuWi8Jm"
    user.feedback_score = 90
    user.num_btc_purchases = 0
    user.num_completed_listings = 0
    user.country = "Australia"
    user.city = "Sydney"
    user.save!

    user = User.new
    user.email = "morgan@admin.com"
    user.password = "admin123"
    user.username = "Morgan"
    user.bio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    user.btc_address = "1EtdZKknyXUtzRqLa4ZLJn5LPkRphqhZDe"
    user.feedback_score = 80
    user.num_btc_purchases = 0
    user.num_completed_listings = 0
    user.country = "Australia"
    user.city = "Sydney"
    user.save!

    user = User.new
    user.email = "ross@admin.com"
    user.password = "admin123"
    user.username = "Ross"
    user.bio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    user.btc_address = "12hw4mhjEVBEjkfruJJC1Tr42whn1eZZ8D"
    user.feedback_score = 100
    user.num_btc_purchases = 0
    user.num_completed_listings = 0
    user.country = "Australia"
    user.city = "Sydney"
    user.save!
end

# Seeding structure - user actions
# Admin, Alice and Bob will create Listings only, will not have any purchases
# Morgan and Ross will only be making Purchases, will not have any listings
# Hugh will have both Listings and Purchases

# Listing Seeds
case Rails.env
when "development"
    # Alternate syntax that could be used instead of using input as ID
    # User.first.listings.create(title: "BTC 4 Sale", description: "lorem ipsum", payment_method: "Credit Card", price_BTC_AUD:13000, amount: 4000)
    title = "Bitcoin for sale"
    description = "lorem ipsum"
    payment_method = "Credit Card"

    for i in 0..3
        price_BTC_AUD = 13000
        amount = 1000
        
        5.times do
            Listing.create(user_id: i, title: title, description: description, payment_method: payment_method, price_BTC_AUD: price_BTC_AUD, amount: amount, status: :available_listing)
            amount += 1000
            price_BTC_AUD += 100
        end
    end

end


#Purchase Seeds - Purchase can only exist if Listing exists first - needs Listing ID

# Seed makes it that Morgan and Ross both make two purchases
case Rails.env
when "development"
    # Morgan purchase listing 1 but has not given feedback or had the BTC sent (user controlling listing updates btc_sent)
    Purchase.create(user_id: 5, listing_id: 1, feedback_for_seller: nil, btc_sent: :not_sent)
    listing = Listing.find(1)
    listing.status = :pending_completion
    listing.save!
    # Morgan purchased listing 2 and received Bitcoin, gave negative feedback
    Purchase.create(user_id: 5, listing_id: 2, feedback_for_seller: :negative, btc_sent: :sent)
    listing = Listing.find(2)
    listing.status = :completed_listing
    listing.save!
    # Morgan purchased listing 3 and received Bitcoin, gave postive feedback
    Purchase.create(user_id: 5, listing_id: 3, feedback_for_seller: :positive, btc_sent: :sent)
    listing = Listing.find(3)
    listing.status = :completed_listing
    listing.save!

    # Ross purchased listing 7 but has not given feedback or had the BTC sent
    Purchase.create(user_id: 6, listing_id: 7, feedback_for_seller: nil, btc_sent: :sent)
    listing = Listing.find(7)
    listing.status = :pending_completion
    listing.save!
    # Ross purchased listing 11, received Bitcoin but has not given feedback
    Purchase.create(user_id: 6, listing_id: 11, feedback_for_seller: nil, btc_sent: :sent)
    listing = Listing.find(11)
    listing.status = :completed_listing
    listing.save!
end

# Example: Checking if a Listing is purchased:
# Purchase.where(listing_id: 1).empty?

# Example: Updating a User Listing that BTC has been sent to the Purchase (owned by another User)
# User.first.listings.first.purchase.update(btc_sent: true)
