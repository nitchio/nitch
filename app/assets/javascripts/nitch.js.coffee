$ ->
  resizeFunc = ->
    $('#nitch-sidebar-left').height($(window).height() - 51)
    $('#nitch-sidebar-right').height($(window).height() - 51)

  # resizeFunc()
  # $(window).resize(resizeFunc)

  # $('#new_archive').submit ->
  #   alert('yep')
  # 
  # $('#new-archive-submit').click ->
  #   $('#new_archive').submit()