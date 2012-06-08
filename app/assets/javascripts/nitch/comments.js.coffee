$ ->
  $('.new-comment-link').click (event) ->
    $($(this).attr('href')).show().find('textarea').focus()

    event.preventDefault()