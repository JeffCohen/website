require 'open-uri'
class Blackhawks

  def self.next_game
    note = Note.find_by(name: 'blackhawks.calendar')
    if note
      games = JSON.parse(note.value)['DataBag']
      game = games.detect do |game|
        start_date = Time.parse(game['StartDateTime']).to_date
        (start_date >= '2017-10-01'.to_date) && (start_date >= Date.today)
      end
    else
      nil
    end
  end

  def self.refresh(force = false)
    note = Note.find_by(name: 'blackhawks.calendar')
    return note if !force && (note && note.updated_at > 1.day.ago)

    note ||= Note.new(name: 'blackhawks.calendar')

    begin
      Rails.logger.info "Refresing Blackhawks data..."
      json = open('http://nhl.calreply.net/blackhawks/EventsList').read
      json = json.sub('🏒','')
      if json
        note.value = json
        note.save
      end
      note
    rescue => e
      Rails.logger.warn "COULD NOT REFRESH BLACKHAWKS"
      Rails.logger.warn e.message
      nil
    end
  end

  def self.refresh_and_announce_to_slack_if_launch_changed
    note = Note.find_by(name: 'spacex.next')
    old_launch_time = note.try(:value)
    refresh
    note.reload
    if old_launch_time != note.value
      Rails.logger.info "New launch time: #{note.value}"
      url = 'https://hooks.slack.com/services/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'

      json_headers = {"Content-Type" => "application/json",
                      "Accept" => "application/json"}

      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)

      scheduled = Time.parse(note.value).in_time_zone('America/Chicago').strftime("%A, %B %e, %Y at %l:%M %P")
      message = "New launch time!\nNow scheduled for: #{scheduled}".sub(/  /,' ')

      response = http.post(uri.path, message, json_headers)
      Rails.logger.info "Sent to slack: #{response.code}"
    end

  end

end
