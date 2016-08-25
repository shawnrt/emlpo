class ChargesController < ApplicationController

def new
  @membership = Membership.find(params[:membership_id])
  if @membership.nil?
    flash[:error] = "membership not found"
    redirect_to "/"
  end
  @membership_type = @membership.membership_type
end

def index
  @membership = Membership.find(params[:membership_id])
end

def show
  @membership = Membership.find(params[:membership_id])
  @charge = @membership.charges.find(params[:id])
end

def create
  @membership = Membership.find(params[:membership_id])
  # Amount in cents
  @membership_type = @membership.membership_type
  @stripe_token = params[:stripe_token]
  Stripe.api_key = "sk_test_KeUhLBnmsGIZ3XYid8CUUIJo"

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
      flash[:error] = "There was a problem charging your account. Please check all fields and try again."
    end
  end


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to "/"
  end
end
