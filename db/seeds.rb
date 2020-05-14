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