class CommandsController < ApplicationController

  include ActionView::Helpers::DateHelper

  def blackhawks
    game = Blackhawks.next_game
    if !game
      message = "I don't know when the next game is."
    else
      t = Time.parse(game['StartDateTime']) - 1.hour
      opponent = game['Name'].sub(/\s*Chicago Blackhawks\s*/,'')
      location = "Home"
      location = "Away" if opponent.starts_with?('@')
      opponent = opponent.sub('@','').strip

      eta = distance_of_time_in_words(t - Time.now)
      scheduled = t.strftime("%A, %B %e, %Y at %l:%M %P %Z")
      scheduled.sub!(/  /,' ')
      message = "[#{location.upcase}] #{opponent} in #{eta}!\n#{scheduled}".sub(/  /,' ')
    end

    render plain: message
  end

  def spacex
    t = Spacex.next_launch

    if !t || (Time.now > t)
      message = "I don't know the time of the next launch."
    else
      eta = distance_of_time_in_words(t - Time.now)
      scheduled = t.in_time_zone('America/Chicago').strftime("%A, %B %e, %Y at %l:%M %P %Z")
      message = "The next launch is in #{eta}!\n#{scheduled}".sub(/  /,' ')
    end

    render plain: message
  end

end
