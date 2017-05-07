module ApplicationHelper

  def client_logos
    logos = %w(bloomberg.jpg scaledown.png enova.png
          groupon.png zoku.svg ama.png juniper.jpg pch.png
          inventables.png ilboe.png blue_magnet.png chicago_run.jpg )
    logos.map { |logo| "clients/#{logo}" }
  end
end
