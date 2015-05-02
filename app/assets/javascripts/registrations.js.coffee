# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#type_Developer[type="radio"]').click ->
    if $(this).is(':checked')
      $('#facebook_button_register_page a').attr('href','/users/auth/facebook' + '?type=Developer')
    return
  return

$ ->
  $('#type_Employer[type="radio"]').click ->
    if $(this).is(':checked')
      $('#facebook_button_register_page a').attr('href','/users/auth/facebook' + '?type=Employer')
    return
  return