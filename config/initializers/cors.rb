Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # Replace with your domain or '*' to allow all domains.

    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options],
             credentials: false
  end
end
