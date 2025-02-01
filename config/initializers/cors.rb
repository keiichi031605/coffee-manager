Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3001' # Frontend's origin

    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head],
             credentials: true, # Allow credentials (cookies, etc.)
             expose: ['Authorization'] # Expose headers like Authorization for JWT
  end
end
