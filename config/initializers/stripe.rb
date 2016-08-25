Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_3Xf2wmCeXMSmfai87ZxxGiwh'],
  :secret_key      => ENV['sk_test_KeUhLBnmsGIZ3XYid8CUUIJo']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
