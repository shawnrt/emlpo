class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def membership_path
    "/memberships"
  end

  def after_sign_in_path_for(resource)
    membership_path
  end
end
