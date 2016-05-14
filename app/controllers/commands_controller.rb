class CommandsController < ApplicationController

  include ActionView::Helpers::DateHelper

  def spacex
    t = Spacex.next_launch

    if !t || (Time.now > t)
      message = "I don't know the time of the next launch."
    else
      eta = distance_of_time_in_words(t - Time.now)
      scheduled = t.in_time_zone('America/Chicago').strftime("%A, %B %e, %Y at %l:%M %P")
      message = "The next launch is in #{eta}!\n#{scheduled}".sub(/  /,' ')
    end

    render plain: message
  end

end
