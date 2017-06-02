module ApplicationHelper

  def client_logos
    logos = %w(bloomberg.jpg wyzant.jpg scaledown.png nu.png enova.png
          groupon.png uchicago.gif zoku.svg ama.png juniper.jpg pch.png
          inventables.png ilboe.png blue_magnet.png chicago_run.jpg )
    logos.map { |logo| "clients/#{logo}" }
  end
end
