# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#hack-form").closest('form').on 'submit', (e) ->
    e.preventDefault();
    u = $("#username").val()
    p = $("#password").val()
    if (u == 'stan') and (p == 'mikita')
      console.debug "Congratulations! You are ready for KIEI-925.  See you in class!"
    else
      console.error "Nice try, but you didn't say the magic word."
