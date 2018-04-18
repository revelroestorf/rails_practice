Rails.configuration.stripe = {
  publishable_key: ENV['PUBLISHABLE_KEY'],
  secret_key: ENV['SECRET_KEY']
}
# So we can use the key - access the ENV array
Stripe.api_key = ENV['SECRET_KEY']
# So Stripe can access the key 
