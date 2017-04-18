module ApplicationHelper

  def client_logos
    logos = %w(bloomberg.jpg scaledown.png enova.png
          groupon.png juniper.jpg pch.png blue_magnet.png chicago_run.jpg )
    logos.map { |logo| "clients/#{logo}" }
  end
end
