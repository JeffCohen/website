require 'open-uri'
class Spacex

  def self.next_launch
    # note = self.refresh
    note = Note.find_by(name: 'spacex.next')
    Time.parse(note.value) rescue nil
  end

  def self.refresh
    note = Note.find_by(name: 'spacex.next')
    return note if note && note.updated_at > 1.hour.ago

    note ||= Note.new(name: 'spacex.next')

    begin
      Rails.logger.info "Refresing Spacex data..."
      json = open('https://launchlibrary.net/1.2/launch?next=50&mode=verbose').read
      data = JSON.parse(json)
      spacex_launch = data['launches'].detect { |l| l['name'] =~ /falcon/i }
      if spacex_launch
        note.value = spacex_launch['net']
        note.save
      end
      note
    rescue => e
      Rails.logger.warn "COULD NOT REFRESH SPACEX"
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
