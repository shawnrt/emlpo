class ChargesController < ApplicationController
#  before_filter :redirect_to_https
  before_filter :load_membership
  before_filter :login_from_session!
  before_filter :ensure_authenticated!

def new
  if @membership.nil?
    flash[:error] = "membership not found"
    redirect_to "/"
  end
  @membership_type = @membership.membership_type
end

def index
end

def show
  @charge = @membership.charges.find(params[:id])
end

def create
  # Amount in cents
  @membership_type = @membership.membership_type
  @stripe_token = params[:stripe_token]

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  stripecharge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @membership_type.price,
    :description => "Charge - #{@membership.first_name} #{@membership.last_name}",
    :currency    => 'cad'
  )

  if stripecharge["paid"] == true
    charge = Charge.create({
      membership: @membership,
      membership_type: @membership_type,
      stripe_token: @stripe_token,
      charge_id: stripecharge.id,
      customer_id: customer.id

    })

    if charge.errors.empty?
      redirect_to "/success"
      NewMembershipMailer.welcome_email(@membership).deliver_now
      NewMembershipMailer.welcome_email_admin(@membership).deliver_now
    else
      redirect_to "/memberships/#{@membership.id}/charges/new"
      flash[:error] = "There was a problem creating your account. Please check all fields and try again."
    end
  end


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to "/memberships/#{@membership.id}/charges/new"
  end
end
