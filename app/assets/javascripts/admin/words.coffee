ready = ->
  answers = $('.answers')

  clearChoice = ->
    i = 0
    while i < answers.length
      $("#correct_answer_"+ i).prop 'checked', false
      $(".correct_answer_"+ i).val 'false'
      i++
    return

  i = 0
  while i < answers.length
    $(answers[i]).on 'click', ->
      clearChoice()
      $(this).prop 'checked', true
      $('.'+$(this).attr('id')).val 'true'
      return
    i++
  return


$(document).ready(ready)
$(document).on('page:load', ready)

$(document).ready ->
  $('body').on 'click', '.btn-delete-word', ->
      $word = $(this).closest('tr')
      if confirm('Are you sure ?')
        $.ajax
          type: 'DELETE'
          url: '/admin/words/' + $(this).data('value')
          dataType: 'json'
          success: (data) ->
            $word.remove()
            $('.flash-massage').replaceWith('<div class="alert alert-success">'+data.flash[0][1]+'</div>')
            return
          error: (error_message) ->
            alert 'error' + error_message
            return
