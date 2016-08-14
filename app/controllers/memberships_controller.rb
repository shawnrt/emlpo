class MembershipsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :create, :new]
  def index
    @memberships = Membership.all
    if current_user.nil?
      redirect_to "/memberships/new"
    end
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
    if @membership.save
      # Tell the UserMailer to send a welcome email after save
      NewMembershipMailer.welcome_email(@membership).deliver_now
    end
    if @membership.errors.empty?
      redirect_to "/"
      flash[:notice] = "Membership created successfully."
    else
      redirect_to "/memberships/new"
      flash[:error] = "There was a problem creating your membership. Please check all fields and try again."
    end
  end
end
