if Rufio::Application.config.honeybadger
  Honeybadger.configure do |config|
    config.api_key = Rufio::Application.config.honeybadger
  end
end
