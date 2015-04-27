$ ->

  $('#select_contract2').change ->
    $('#select_contract2').hide()
    $('#hire_now_button').removeClass('disabled')  
    contract_id = $('#select_contract2 #contract_name option:selected').val()
    developer_id = $('#new_contract').attr('data-developer-id')
    data = {
      contract: {
        contract_id: contract_id
        developer_id: developer_id
      }
    }
    $.ajax({
        type: "POST",
        url: '/contracts/check_developer_minimum',
        data: data,
        dataType: 'json',
        success: (data) -> 
          window.location = '/contracts/'+contract_id+'/edit?developer_id='+developer_id
        error: (data) -> 
          alert ('Contract amount must be greater than the developer\'s minimum contract amount')
      });  

  $('#hire_now_button').addClass('disabled')
  $('.disabled').click (event) ->
    return false 
