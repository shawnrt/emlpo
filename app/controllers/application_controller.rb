class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def membership_path
    "/memberships"
  end

  def after_sign_in_path_for(resource)
    membership_path
  end

  def login_from_session!
    return true if current_user
    if membership_id = session[:membership_id]
      if @current_membership = Membership.find(membership_id)
        unless @current_membership.nil?
          return true
        end
      end
    end
    flash[:error] = "invalid session"
    return redirect_to "/"
  end

  def ensure_authenticated!
    return true if current_user
    redirect_to "/" unless @membership == @current_membership
  end

  def load_membership
    @membership = Membership.find(params[:membership_id] || params[:id])
  end

end
