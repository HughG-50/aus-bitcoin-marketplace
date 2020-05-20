User.destroy_all()

# User seeds
user = User.new
user.email = "admin@admin.com"
user.password = "admin123"
user.username = "admin"
user.bio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
user.btc_address = "1FfmbHfnpaZjKFvyi1okTjJJusN455paPH"
user.feedback_score = nil
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
user.feedback_score = nil
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
user.feedback_score = nil
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
user.feedback_score = nil
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
user.feedback_score = nil
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
user.feedback_score = nil
user.num_btc_purchases = 0
user.num_completed_listings = 0
user.country = "Australia"
user.city = "Sydney"
user.save!


# Seeding structure - user actions
# Admin, Alice and Bob will create Listings only, will not have any purchases
# Morgan and Ross will only be making Purchases, will not have any listings
# Hugh will have both Listings and Purchases

# Listing Seeds
title = "Bitcoin for sale"
description = "lorem ipsum"
payment_method = "Credit Card"

for i in 0..3
    price_BTC_AUD = 13000
    amount = 1000
    status = :available_listing
    
    6.times do
        Listing.create(user_id: i, title: title, description: description, payment_method: payment_method, price_BTC_AUD: price_BTC_AUD, amount: amount, status: status)
        amount += 1000
        price_BTC_AUD += 100
    end
end



#Purchase Seeds

# Seed makes it that Morgan and Ross both make two purchases
# Morgan purchase listing 1 but has not given feedback or had the BTC sent (user controlling listing updates btc_sent)
Purchase.create(user_id: 5, listing_id: 1, btc_sent: :not_sent)
listing = Listing.find(1)
listing.status = :pending_completion 
# listing.feedback_for_seller = nil
listing.save!

purchase = Purchase.find(1)
number_of_purchases = purchase.user.num_btc_purchases + 1
User.find(5).update(num_btc_purchases: number_of_purchases)

# Morgan purchased listing 2 and received Bitcoin, gave negative feedback
Purchase.create(user_id: 5, listing_id: 2, btc_sent: :not_sent)
listing = Listing.find(2)
listing.status = :pending_completion
# listing.feedback_for_seller = nil
listing.save!

purchase = Purchase.find(2)
number_of_purchases = purchase.user.num_btc_purchases + 1
User.find(5).update(num_btc_purchases: number_of_purchases)

# Morgan purchased listing 3 and received Bitcoin, gave postive feedback
Purchase.create(user_id: 5, listing_id: 3, btc_sent: :sent)
listing = Listing.find(3)
listing.status = :completed_listing
listing.feedback_for_seller = "negative"

number_of_completed_listings = listing.user.num_completed_listings + 1
User.find(1).update(num_completed_listings: number_of_completed_listings)

# feedback_score = (0/number_of_completed_listings).to_f
# User.find(1).update(feedback_score: feedback_score)
listing.save!

purchase = Purchase.find(3)
number_of_purchases = purchase.user.num_btc_purchases + 1
User.find(5).update(num_btc_purchases: number_of_purchases)

# Morgan purchased listing 3 and received Bitcoin, gave postive feedback
Purchase.create(user_id: 5, listing_id: 4, btc_sent: :sent)
listing = Listing.find(4)
listing.status = :completed_listing
listing.feedback_for_seller = "positive"

number_of_completed_listings = listing.user.num_completed_listings + 1

feedback_score = (1/number_of_completed_listings.to_f)
User.find(1).update(num_completed_listings: number_of_completed_listings, feedback_score: feedback_score)

# feedback_score = (1/number_of_completed_listings).to_f
# User.find(1).update(feedback_score: feedback_score)
listing.save!

purchase = Purchase.find(4)
number_of_purchases = purchase.user.num_btc_purchases + 1
User.find(5).update(num_btc_purchases: number_of_purchases)

# Ross purchased listing 7 but has not given feedback or had the BTC sent
Purchase.create(user_id: 6, listing_id: 7, btc_sent: :not_sent)
listing = Listing.find(7)
listing.status = :pending_completion
# listing.feedback_for_seller = nil
listing.save!

purchase = Purchase.find(5)
number_of_purchases = purchase.user.num_btc_purchases + 1
User.find(6).update(num_btc_purchases: number_of_purchases)

# Ross purchased listing 11, received Bitcoin but has not given feedback
Purchase.create(user_id: 6, listing_id: 11, btc_sent: :sent)
listing = Listing.find(11)
listing.status = :completed_listing
# listing.feedback_for_seller = nil

number_of_completed_listings = listing.user.num_completed_listings + 1
User.find(2).update(num_completed_listings: number_of_completed_listings)
listing.save!

purchase = Purchase.find(6)
number_of_purchases = purchase.user.num_btc_purchases + 1
User.find(6).update(num_btc_purchases: number_of_purchases)

