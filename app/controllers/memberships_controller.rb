class MembershipsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :create, :new, :edit]
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
    @membership = Membership.find(params[:id])
    @membership_types = MembershipType.all
  end
  def show
    @membership = Membership.find(params[:id])
  end
  def create
    puts params
    params[:memberships].permit!
    @membership = Membership.create(params[:memberships])
    if @membership.errors.empty?
      redirect_to "/memberships/#{@membership.id}/charges/new"
    else
      redirect_to "/memberships/new"
      flash[:error] = "There was a problem creating your membership. Please check all fields and try again."
    end
  end
  def update
    @membership = Membership.update(params[:memberships])
    if @membership.errors.empty?
      redirect_to "/memberships/#{@membership.id}/charges/new"
    else
      redirect_to "/memberships/new"
      flash[:error] = "There was a problem creating your membership. Please check all fields and try again."
    end
  end
end
