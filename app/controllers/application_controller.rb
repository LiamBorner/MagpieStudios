class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  before_action :verify


  def verify
    if current_user
      if current_user.role == 'artist'
        @artist = true
        @artist_logged_in = true
        @logged_in = true
      elsif current_user.role == 'admin'
        @admin = true
      end
    else
      @logged_out = true
      @artist = false
      @admin = false
    end
end
end
