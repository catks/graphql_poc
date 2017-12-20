class ApplicationController < ActionController::API

  def auth_token
    @auth_token ||= request.headers['Authorization'].to_s.split.last
  end
end
