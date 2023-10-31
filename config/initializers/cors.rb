Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '192.168.1.5' # Replace with your domain or '*' to allow all domains.

    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options],
             credentials: true
  end
end
