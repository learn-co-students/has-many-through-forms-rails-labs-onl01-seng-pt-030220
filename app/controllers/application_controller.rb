class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  self.helpers do

    
    def current_user(session)
      user=User.find_by_id(session[:user_id])
    end

  end

end
