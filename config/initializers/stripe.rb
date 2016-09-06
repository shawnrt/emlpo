MAILGUN_CONFIG = YAML.load_file(Rails.root.join('config', 'stripe.yml')).symbolize_keys!

Rails.configuration.stripe = {
  :publishable_key => STRIPE_CONFIG[:publishable_key],
  :secret_key      => STRIPE_CONFIG[:secret_key]
}

Stripe.api_key = STRIPE_CONFIG[:secret_key]
