# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  $('#contact_button_container').mouseover ->
    $('#select_contract').show()
    $('#select_contract2').hide()

$ ->

  $('#hire_button_container').mouseover ->
    $('#select_contract2').show()
    $('#select_contract').hide()

$ ->

  $('#select_contract').change ->
    $('#select_contract').hide()
    $('#request_interview_button').removeClass('disabled')  

$ ->
# when an EMPLOYER contacts a developer on the DEVELOPER SHOW page
  $('#select_contract').change ->
    $('#select_contract').hide()
    $('#request_interview_button').removeClass('disabled')
    contract_id = $('#select_contract #contract_name option:selected').val()
    developer_id = $('#new_contract').attr('data-developer-id')
    data = {
      negotiation: {
        contract_id: contract_id
        developer_id: developer_id
      }
    }
    $.ajax({
        type: "POST",
        url: '/negotiations',
        data: data,
        dataType: 'json',
        success: (data) -> 
          window.location = '/negotiations/'+data.id
        error: (data) -> 
          alert(data.responseText)
      });   

$ ->
  
  $('#request_interview_button').addClass('disabled')
  $('.disabled').click (event) ->
    return false

 