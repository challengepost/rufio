require 'opensesame'

ENV['ORGANIZATION_NAME'] ||= ENV['ORGANISATION_NAME']

OpenSesame.configure do |config|
  config.enable       Rails.env.staging?
  config.github       ENV['GITHUB_APP_ID'], ENV['GITHUB_SECRET']
  config.organization ENV['ORGANIZATION_NAME']
  config.mounted_at   '/opensesame'
end
