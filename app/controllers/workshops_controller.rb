class WorkshopsController < ApplicationController

  PAGES = Dir["app/views/workshops/*.html.*"].map do |path|
            File.basename(path).split('.').first.underscore
          end

  def show
    page = params[:id].underscore
    # logger.debug "page: #{page}"
    # logger.debug "PAGES: #{PAGES}"
    redirect_to root_url unless PAGES.include?(page)
    render page
  end
end
