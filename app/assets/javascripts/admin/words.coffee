ready = ->
  answers = $('.answers')

  clearChoice = ->
    i = 0
    while i < answers.length
      $(answers[i]).prop 'checked', false
      i++
    return

  i = 0
  while i < answers.length
    $(answers[i]).on 'click', ->
      clearChoice()
      $(this).prop 'checked', true
      return
    i++
  return
$(document).ready(ready)
$(document).on('page:load', ready)
