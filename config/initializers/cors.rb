Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:50614'
    resource '*', headers: :any, methods: [:get, :post]
  end

  allow do
    origins /\Ahttp:\/\/localhost(:\d+)?\z/
    resource '*', headers: :any, methods: [:get, :post]
  end
end