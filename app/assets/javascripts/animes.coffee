jQuery ->
  $('.fa-plus-square-o').submit ->
    $('input:submit').attr("disabled", true)