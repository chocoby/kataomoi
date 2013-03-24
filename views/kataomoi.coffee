$ ->
  $.get '/users', (data) ->
    $('tbody#list').append data
