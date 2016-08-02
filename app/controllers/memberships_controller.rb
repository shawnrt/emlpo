class MembershipsController < ApplicationController
  def index
    @memberships = Membership.all
  end
  def new
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
      redirect_to @membership
    else
      redirect_to "/memberships/new"
    end
  end
end
