class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_environments

  protected

  def send_error_notifications?
    !!Rufio::Application.config.honeybadger
  end

  private

  def find_environments
    @environments = Environment.all
  end
end
