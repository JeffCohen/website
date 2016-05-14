class CommandsController < ApplicationController

  include ActionView::Helpers::DateHelper

  def spacex
    t = Time.parse("2016-05-26 21:40 GMT")

    if Time.now > t
      message = "I don't know the time of the next launch."
    else
      eta = distance_of_time_in_words(t - Time.now)
      scheduled = t.in_time_zone('America/Chicago').strftime("%A, %B %e, %Y at %l:%M %P")
      message = "The next launch will be in #{eta}!\n#{scheduled}".sub(/  /,' ')
    end

    render plain: message
  end

end
