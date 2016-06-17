class PaymentsController < ApplicationController

  skip_before_filter :verify_authenticity_token, except: :precheck

  def precheck
    @attendee = Attendee.find_by(email: params[:email])
    @amount_in_cents = 180 * 100
  end

  def new
  end

  def create
    @amount_in_cents = 180 * 100

    token = params[:stripeToken]

    begin
      charge = Stripe::Charge.create(
        :amount => @amount_in_cents,
        :currency => "usd",
        :source => token,
        :description => "Google Workshop",
        :metadata => { "email" => params[:stripeEmail], "workshop" => "google" }
      )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path

    end
  end
  
end
