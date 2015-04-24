# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#hidden-register-name-dropdown-links').hide()
  $('#register_name').mouseover ->
    $('#hidden-register-name-dropdown-links').show()
  $('#hidden-register-name-dropdown-links').mouseout ->
    $('#hidden-register-name-dropdown-links').hide()
  $('#hidden-register-name-dropdown-links').mouseover ->
    $('#hidden-register-name-dropdown-links').show()

# hack to hide drop-down navigation bug if user's mouse exits through top-bar
$(document).ready ->
  $('img').mouseover ->
    $('#hidden-register-name-dropdown-links').hide()