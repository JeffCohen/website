require 'open-uri'
class Spacex

  def self.next_launch
    note = self.refresh
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
    rescue => e
      Rails.logger.warn "COULD NOT REFRESH SPACEX"
      Rails.logger.warn e.message
    end
  end
end
