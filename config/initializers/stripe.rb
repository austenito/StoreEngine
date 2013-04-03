Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY=pk_foo'],
  :secret_key      => ENV['SECRET_KEY=sk_bar rails s']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
