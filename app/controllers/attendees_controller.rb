class AttendeesController < ApplicationController

  layout 'payments'
  before_action :require_admin

  def require_admin
    redirect_to root_path unless params[:password] == 'hockey' || session[:p] == 'ok'
  end

  def index
    session[:p] = 'ok'
    @attendees = Attendee.order('created_at desc')

    respond_to do |format|
      format.html
      format.json { render json: @attendees }
    end
  end

  def create
    Attendee.create(email: params[:attendee][:email])
    redirect_to attendees_url
  end

  def update
    if params[:paid]
      Attendee.find(params[:id]).update paid: params[:paid]
    end
    redirect_to attendees_url
  end
end
