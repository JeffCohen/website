class WorkshopsController < ApplicationController

  def show
    redirect_to root_url unless params[:id] == 'front-end'
      
  end
end
