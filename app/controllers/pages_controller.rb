class PagesController < ApplicationController

  layout 'blog', only: :show

  def ping
    render plain: "pong #{request.remote_ip}"
  end

  def show
    filename = params[:title].strip.downcase
    path = File.join(Rails.root, 'blog', filename + ".md")
    @content = File.read(path)
  end
end
