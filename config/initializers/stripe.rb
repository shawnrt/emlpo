Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_t3feYzXbXeKcTAzM6TclamXk'],
  :secret_key      => ENV['sk_test_gptqCO3O4z5kWVv6JSg76Xaq']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
