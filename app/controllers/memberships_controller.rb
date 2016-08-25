class MembershipsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :new, :edit, :login, :create]
  before_filter :load_membership, only: [:show, :edit, :update]
  before_filter :login_from_session!, except: [:index, :new, :login, :create]
  before_filter :ensure_authenticated!, except: [:index, :new, :login, :create]

  def index
    @memberships = Membership.all
    if current_user.nil?
      redirect_to "/memberships/new"
    end
  end
  def new
    @membership_types = MembershipType.all
  end
  def edit
    @membership_types = MembershipType.all
  end
  def show
    #redirect_to "/" unless @membership == @current_membership
    @membership
  end
  def create
    puts params
    params[:memberships].permit!
    @membership = Membership.create(params[:memberships])
    if @membership.errors.empty?
      session[:membership_id] = @membership.id
      redirect_to "/memberships/#{@membership.id}/charges/new"
    else
      redirect_to "/memberships/new"
      flash[:error] = "There was a problem creating your membership. Please check all fields and try again."
    end
  end
  def update
    params[:memberships].permit!
    @membership.update_attributes(params[:memberships])
    if @membership.errors.empty?
      redirect_to "/memberships/#{@membership.id}/charges/new"
    else
      redirect_to "/memberships/new"
      flash[:error] = "There was a problem creating your membership. Please check all fields and try again."
    end
  end

  def login
    @membership = Membership.where(token: params[:token]).first
    if @membership
      session[:membership_id] = @membership.id
      redirect_to "/memberships/#{@membership.id}"
    else
      redirect_to "/"
    end
  end

  def logout
    session[:membership_id] = nil
    flash[:info] = "logged out"
    redirect_to "/"
  end

end
