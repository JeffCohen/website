class PagesController < ApplicationController

  def ping
    render plain: "pong #{request.remote_ip}" 
  end

end
