MAILGUN_CONFIG = YAML.load_file(Rails.root.join('config', 'mailgun.yml')).symbolize_keys!

