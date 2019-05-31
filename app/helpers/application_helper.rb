module ApplicationHelper

  def markdown(text)
    md = ERB.new(text).result(binding)
    html = CommonMarker.render_html(md, :GITHUB_PRE_LANG, [:table, :autolink])
    html.html_safe
  end

  def client_logos
    logos = %w(bloomberg.jpg wyzant.jpg trunk_club.png scaledown.png nu.png enova.png
          groupon.png uchicago.gif zoku.svg ama.png juniper.jpg pch.png
          inventables.png ilboe.png blue_magnet.png 8bit.png  chicago_run.jpg )
    logos.map { |logo| "clients/#{logo}" }
  end
end
